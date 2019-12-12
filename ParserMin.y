{
module ParserMin where
import LexerMin
}

%name parser
%tokentype { Token }
%error { parseError }

-- List of grammar endpoints
%token

    -- Keywords
    let     { TLet      }
    in      { TIn       }
    int     { TInt $$   }
    if      { TIf       }
    then    { TThen     }
    else    { TElse     }
    def     { TDef $$   }

    -- Variable and functions
    var     { TVar $$   }
    func    { TFunc $$  }

    -- Symbols
    "="     { TSym "="  }
    "+"     { TSym "+"  }
    "-"     { TSym "-"  }
    "*"     { TSym "*"  }
    "<="    { TSym "<=" }
    ">="    { TSym ">=" }
    "<"     { TSym "<"  }
    "("     { TSym "("  }
    ")"     { TSym ")"  }
    ","     { TSym ","  }

-- Priority and associativity definition
%right in
%right else

%left "<=" ">=" "<"
%left "+" "-"
%left "*"
%%

-- Grammar rules
Line : Def {$1}
    | Exp {$1}

Def : def func Vars "=" Exp {Def $2 $3 $5}

Exp : let var "=" Exp in Exp    { Let $2 $4 $6      }
| Exp "+" Exp                   { Bin "+" $1 $3     }
| Exp "-" Exp                   { Bin "-" $1 $3     }
| Exp "*" Exp                   { Bin "*" $1 $3     }
| Exp "<=" Exp                  { Bin "<=" $1 $3    }
| Exp ">=" Exp                  { Bin ">=" $1 $3    }
| Exp "<" Exp                   { Bin "<" $1 $3    }
| if Exp then Exp else Exp      { If $2 $4 $6       }
| func  "(" Exps ")"            { Func $1 $3        }
| int                           { Cst $1            }
| var                           { Var $1            }

-- Rules for list of expressions
Exps : Exp      { [$1]  }
| Exp "," Exps  { $1:$3 } -- Convert expressions sparated by `,` into a list

Vars : var {[$1]}
| var Vars {$1:$2}

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

-- Definition of the Exp type used to build the syntactic tree
data Exp =
    Let Name Exp Exp
    | Bin [Char] Exp Exp
    | Cst Int
    | Var Name
    | If Exp Exp Exp
    | Func Name [Exp]
    | Def Name [Name] Exp
    deriving Show
}