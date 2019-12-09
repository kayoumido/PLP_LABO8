module Lab8 where

import           Data.Char
import           LexerMin
import           ParserMin

type Op = [Char]

value name (vars, _) = value' name vars
    where
    value' name [] = error $ "Undefined variable: " ++ name
    value' name ((var, val):vars) =
        if name == var
        then val
        else value' name vars

extract name (_, funcs) = extract' name funcs
    where
    extract' name [] = error $ "Undefined function: " ++ name
    extract' name ((func, vars, body):funcs) =
        if name == func
        then (vars, body)
        else extract' name funcs

bool op x y =
    if (op x y)
    then 1
    else 0

expand env [] [] = env
expand env (v:vs) (x:xs) = ((v, eval x env) : vars, funcs)
    where
    (vars, funcs) = expand env vs xs

eval (Cst n) _ = n
eval (Var v) env = value v env

eval (Bin "+" a b) env = (eval a env) + (eval b env)
eval (Bin "-" a b) env = (eval a env) - (eval b env)
eval (Bin "*" a b) env = (eval a env) * (eval b env)
eval (Bin "<" a b) env = bool (<) (eval a env) (eval b env)
eval (Bin "<=" a b) env = bool (<=) (eval a env) (eval b env)
eval (Bin ">=" a b) env = bool (>=) (eval a env) (eval b env)

eval (If p ifTrue ifFalse) env
    | eval p env < 1 = eval ifFalse env
    | otherwise = eval ifTrue env

eval (Let n x y) env@(vars, funcs) = eval y ((n, eval x env) : vars, funcs)
eval (Func func xs) env = eval body $ expand env vars xs
    where
    (vars, body) = extract func env

funcs =
    [ ("Succ", ["N"], Bin "+" (Var "N") (Cst 1)), 
      ("Pred", ["N"], Bin "-" (Var "N") (Cst 1))
    , ("SuiteGeo", ["N"], 
        If
            (Var "N")
            (Bin "+" (Var "N") (Func "SuiteGeo" [Func "Pred" [Var "N"]]))
            (Cst 0)),
    ("Suitefib", ["N"], 
        If
            (Bin "<=" (Var "N") (Cst 1))
            (Var "N")
            (Bin "+" (Func "Suitefib" [Func "Pred" [Var "N"]]) (Func "Suitefib" [Bin "-" (Var "N") (Cst 2)]))),
    ("Fact", ["N"], 
        If
            (Var "N")
            (Bin "*" (Var "N") (Func "Fact" [Func "Pred" [Var "N"]]))
            (Cst 1))
    ]

env :: ([(Name, Int)], [(Name, [Name], Exp)])
env = ([("a", 1), ("b", 2), ("c", 3)], funcs)

main = do
    s <- getLine
    print $ eval (parser $ lexer s) env
    if null s
    then return ()
    else main
