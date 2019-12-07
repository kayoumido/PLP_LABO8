{
module ParserMin where
import LexerMin
}

%name parser
%tokentype { Token }
%error { parseError }

-- Liste des terminaux de la grammaire.
%token

-- mots cles
let { TLet }
in { TIn }
int { TInt $$ }
if { TIf }
then { TThen }
else { TElse }

-- Variable et fonction
var { TVar $$ }
func {TFunc $$}

-- Symboles
"=" { TSym "=" }
"+" { TSym "+" }
"-" { TSym "-" }
"*" { TSym "*" }
"<=" { TSym "<=" }
"+=" { TSym "+=" }
">=" { TSym ">=" }
"(" { TSym "(" }
")" { TSym ")" }
"," {TSym "," }

-- Définition des priorités et associativité
%right in
%right else

%left "<=" ">="
%right "+="
%left "+" "-" 
%left "*"
%%

-- Règles de la grammaire
Exp : let var "=" Exp in Exp { Let $2 $4 $6 }
| Exp "+" Exp { Bin "+" $1 $3 }
| Exp "-" Exp { Bin "-" $1 $3 }
| Exp "*" Exp { Bin "*" $1 $3 }
| Exp "<=" Exp {Bin "<=" $1 $3}
| Exp "+=" Exp {Bin "+=" $1 $3}
| Exp ">=" Exp {Bin ">=" $1 $3}
| if Exp then Exp else Exp {If $2 $4 $6}
| func  "(" Exps ")" { Func $1 $3}
| int { Cst $1 }
| var { Var $1 }

-- Règles pour une liste d'expression
Exps : Exp { [$1] }
| Exp "," Exps { $1:$3 } -- retourne une liste d'expression

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

-- Définition du type Exp utilisé pour construire l'arbre syntaxique.
data Exp = Let Name Exp Exp | Bin [Char] Exp Exp | Cst Int | Var Name | If Exp Exp Exp | Func Name [Exp] deriving Show
}