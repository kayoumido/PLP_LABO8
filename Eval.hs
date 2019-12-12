module Lab8 where

import LexerMin
import ParserMin

type Op = [Char]

-- Search in a given environment for the value of a variable
value name (vars, _) = value' name vars
    where
    value' name [] = error $ "Undefined variable: " ++ name
    value' name ((var, val):vars) =
        if name == var
        then val
        else value' name vars

-- Search in a given environment for the definition of a function
extract name (_, funcs) = extract' name funcs
    where
    extract' name [] = error $ "Undefined function: " ++ name
    extract' name ((func, vars, body):funcs) =
        if name == func
        then (vars, body)
        else extract' name funcs

-- Function to define boolean functions
bool op x y =
    if (op x y)
    then 1
    else 0

-- expand an evironment w/ new variables
expandVar env [] [] = env
expandVar env (v:vs) (x:xs) = ((v, eval x env) : vars, funcs)
    where (vars, funcs) = expandVar env vs xs

-- EVALUTORS

eval (Cst n) _ = n
eval (Var v) env = value v env

eval (Bin "+" a b) env = (eval a env) + (eval b env)
eval (Bin "-" a b) env = (eval a env) - (eval b env)
eval (Bin "*" a b) env = (eval a env) * (eval b env)

eval (Bin "<" a b) env  = bool (<) (eval a env) (eval b env)
eval (Bin "<=" a b) env = bool (<=) (eval a env) (eval b env)
eval (Bin ">=" a b) env = bool (>=) (eval a env) (eval b env)

eval (If p ifTrue ifFalse) env
    | eval p env < 1 = eval ifFalse env
    | otherwise = eval ifTrue env
    

eval (Let n x y) env@(vars, funcs) = eval y ((n, eval x env) : vars, funcs)

eval (Func func xs) env = eval body $ expandVar env vars xs
    where (vars, body) = extract func env

-- expand an evironment w/ new function
def (Def name n body) env@(vars, funcs) = (vars, (name, n, body):funcs)

funcs = [
    ("Succ", ["N"], Bin "+" (Var "N") (Cst 1)),
    ("Pred", ["N"], Bin "-" (Var "N") (Cst 1)),
    ("Geoseries", ["N"],
        If (Var "N")
            (Bin "+" (Var "N") (Func "Geoseries" [Func "Pred" [Var "N"]]))
            (Cst 0)
        ),
    ("Fibonacci", ["N"],
        If (Bin "<=" (Var "N") (Cst 1))
            (Var "N")
            (Bin "+" (Func "Fibonacci" [Func "Pred" [Var "N"]]) (Func "Fibonacci" [Bin "-" (Var "N") (Cst 2)]))
        ),
    ("Fact", ["N"],
        If (Var "N")
            (Bin "*" (Var "N") (Func "Fact" [Func "Pred" [Var "N"]]))
            (Cst 1)
        )
    ]

-- ([Variables], [Function definitions])
env :: ([(Name, Int)], [(Name, [Name], Exp)])
env = ([("a", 1), ("b", 2), ("c", 3)], funcs)


-- Main
main env = do
    putStr "SLP> "
    s <- getLine

    if null s
        then
            return ()
        else do
            let tokens = lexer s 
            putStrLn $ show tokens
            let ast = parser tokens
            putStrLn $ show ast
            case ast of
                (Def name vars body) -> do
                    putStrLn $ show name
                    main (def ast env) 
                _ -> do
                    putStrLn $ show $ eval ast env
                    main env
