{
module Saoirse (
    lexer,
    Name,
    Token(..)
) where
}

%wrapper "basic"

$digit = 0-9
$lower = [a-z]
$upper = [A-Z]

tokens :-
    $white+ ;

    let     { \s -> TLet    }
    in      { \s -> TIn     }
    if      { \s -> TIf     }
    then    { \s -> TThen   }
    else    { \s -> TElse   }

    "+"
    | "-"
    | "*"
    | "<"
    | "<="
    | "("
    | ")" { \s -> TSym s }

    $digit+         { \s -> TInt (read s)   }
    $lower+         { \s -> TVar s          }
    $upper$lower+   { \s -> TFunc s         }

{
type Name = [Char]
data Token =
    TLet
    | TIn
    | TIf
    | TThen
    | TElse
    | TSym [Char]
    | TVar Name
    | TFunc Name
    | TInt Int
    deriving (Eq,Show)

lexer = alexScanTokens
}