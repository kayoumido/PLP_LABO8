{
-- Définition du nom du module et des exports.
module LexerMin (lexer, Name, Token(..)) where
}

-- Le wrapper définit le type de analyseur que Alex va générer.
%wrapper "basic"
$digit = 0-9 -- Macro pour définir les chiffres.
$lower = [a-z] -- Macro pour définir les lettres minuscules.
$upper = [A-Z] -- Macro pour définir les lettres majuscules.

-- Règles, chaque règle doit spécifier une lambda expression de type [Char] -> Token
tokens :-
    $white+ ;

    -- mot clé
    let { \s -> TLet }
    in { \s -> TIn }
    if { \s -> TIf}
    then {\s -> TThen}
    else { \s -> TElse}

    -- literaux
    $digit+ { \s -> TInt (read s) }

    -- Symbole
    "<=" | "+=" | ">=" | "=" | "+" | "*" | "(" | ")" | ","{ \s -> TSym s}

    -- Variable et fonction
    $lower+ { \s -> TVar s }
    $upper$lower* { \s -> TFunc s}

{
-- Définition du type Token.
type Name = [Char]
data Token = TLet | TIn | TSym [Char] | TVar Name | TInt Int | TFunc Name | TIf | TThen | TElse deriving (Eq,Show)

-- Alias du nom de la fonction d'analyse lexicale.
lexer = alexScanTokens
}