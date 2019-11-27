module Lab8 where

import Data.Char

type Op = [Char]
type Name = [Char]
data Exp = Cnst Int | Bin Op Exp Exp | Un Op Exp | Cond Exp Exp Exp |
     Var Name | Let Name Exp Exp | App Name [Exp] | Def Name [Name] Exp deriving (Show)

value name (vars, _) = value' name vars
    where value' name [] = 0
          value' name ((var, val): vars) = 
            if name == var then val else value' name vars

extract name (_, funcs) = extract' name funcs
    where extract' name [] = error $ "Undefined function: " ++ name
          extract' name ((func, vars, body):funcs) = 
            if name == func then (vars, body) else extract' name funcs

bool op x y  = if (op x y ) then 1 else 0

expand env [] [] = env
expand env (v:vs) (x:xs) = ((v,eval x env):vars, funcs)
    where (vars, funcs) = expand env vs xs

eval (Cnst n) _         = n
eval (Var v) env        = value v env

eval (Bin "+" a b) env  = (eval a env) + (eval b env)
eval (Bin "-" a b) env  = (eval a env) - (eval b env)
eval (Bin "<" a b) env  = bool (<) (eval a env) (eval b env)
eval (Bin "<=" a b) env  = bool (<=) (eval a env) (eval b env)

eval (Un "-" a) env     = - eval a env

eval (Cond p ifTrue ifFalse) env
    | eval p env < 1  = eval ifFalse env
    | otherwise       = eval ifTrue env

eval (Let n x y) env@(vars, funcs) = eval y ((n, eval x env):vars, funcs)

eval (App func xs ) env = eval body $ expand env vars xs where (vars, body) = extract func env

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

-- TEST --
plusPetit = (Bin "<" (Cnst 5) (Cnst 2))

funcs = 
    [
        ("succ", ["N"], Bin "+" (Var "N") (Cnst 1)),
        ("pred", ["N"], Bin "-" (Var "N") (Cnst 1)),
        ("somme", ["N"], 
            Cond 
                (Var "N") 
                (Bin "+" (Var "N") (App "somme" [App "pred" [Var "N"]]))
                (Cnst 0))
    ]

env :: ([(Name, Int)], [(Name, [Name], Exp)])
env = ([("a", 1), ("b", 2), ("c", 3)], funcs)
