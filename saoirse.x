{
module Saoirse (
    lexer,
    Name,
    Token(..)
) where
}

-- Define the type of wrapper used by Alex
%wrapper "basic"

-- Define macros
$digit = 0-9
$lower = [a-z]
$upper = [A-Z]

-- Defining Lexeme
tokens :-
    $white+ ;

    -- General Keywords
    let     { \s -> TLet    }
    in      { \s -> TIn     }
    if      { \s -> TIf     }
    then    { \s -> TThen   }
    else    { \s -> TElse   }

    -- Operators & special symboles
    "+"
    | "-"
    | "*"
    | "<"
    | "<="
    | "("
    | ")" { \s -> TSym s }

    -- Constants, Variables and Function
    $digit+                         { \s -> TInt (read s)   }
    $lower[$lower$upper$digit\_]*   { \s -> TVar s          }
    $upper[$lower$upper$digit\_]*   { \s -> TFunc s         }

{
type Name = [Char]

-- Define Token type
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

-- Set alias for the complicated alex function
--  What were they thinking w/ a name like that ?!
lexer = alexScanTokens
}