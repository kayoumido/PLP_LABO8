module Luthor where

import Data.Char

lexer [] = []
lexer (c:cs)
    | isSpace c = lexer cs
    | isAlpha c = lexSym (c:cs)
    | isDigit c = lexInt (c:cs)

lexer ('<':'=':cs) = "<=": lexer cs -- <- C MOA KA FÉ (DODO)
lexer ('<':cs) = "<": lexer cs
lexer ('-':cs) = "-": lexer cs
lexer ('+':cs) = "+": lexer cs
lexer ('=':cs) = "=": lexer cs


lexInt cs = int : lexer rest
    where (int, rest) = span isDigit cs

lexSym cs = symbol : lexer rest
    where (symbol,rest) = span isAlpha cs