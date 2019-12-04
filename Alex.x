{
-- Définition du nom du module et des exports.
module LexerMin (lexer, Name, Token(..)) where
}
-- Le wrapper définit le type de analyseur que Alex va générer.
%wrapper "basic"
$digit = 0-9 -- Macro pour définir les chiffres.
$alpha = [A-Za-z] -- Macro pour définir les lettres.
-- Règles, chaque règle doit spécifier une lambda expression de type [Char] -> Token
tokens :-
$white+ ;
let { \s -> TLet }
in { \s -> TIn }
$digit+ { \s -> TInt (read s) }
"<=" {\s -> TOp s}
[\=\+\*\(\)] { \s -> TSym (head s) }
$alpha+ { \s -> TVar s }
{
-- Définition du type Token.
type Name = [Char]
data Token = TLet | TIn | TSym Char | TVar Name | TInt Int | TOp [Char] deriving (Eq,Show)
-- Alias du nom de la fonction d'analyse lexicale.
lexer = alexScanTokens
}