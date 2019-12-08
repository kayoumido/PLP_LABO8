module Saoirse where

type Op     = [Char]
type Name   = [Char]
data Exp    =
    Cst Int
    | Bin Op Exp Exp
    | Un Op Exp
    | Fi Exp Exp Exp
    | Var Name
    | Let Name Exp Exp
    | App Name [Exp]
    | Def Name [Name] Exp
    deriving (Show)

bool op x y = if (op x y ) then 1 else 0

-- Search in a given environment for the value of a variable
value name (vars, _) = value' name vars
    where value' name [] = error $ "Undefined variable " ++ name
          value' name ((var, val):vars) =
            if name == var then
                val
            else
                value' name vars

-- Search in a given environment for the definition of a function
extract name (_, defs) = extract' name defs
    where extract' name [] = error $ "Undefined function " ++ name
          extract' name ((def, args, body):defs) =
            if name == def then
                (args, body)
            else
                extract' name defs

-- Expand an evironment w/ new variables
expand env [] [] = env
expand env (arg:args) (val:vals) = ((arg, eval val env):vars, funcs)
    where (vars, funcs) = expand env args vals


eval (Cst n) _   = n
eval (Var v) env = value v env

eval (Bin "+" a b) env  = (eval a env) + (eval b env)
eval (Bin "-" a b) env  = (eval a env) - (eval b env)
eval (Bin "*" a b) env  = (eval a env) * (eval b env)

eval (Bin "<" a b) env  = bool (<) (eval a env) (eval b env)
eval (Bin "<=" a b) env = bool (<=) (eval a env) (eval b env)

eval (Un "-" a) env     = - eval a env

eval (Fi cond x y) env =
    if (eval cond env) > 0 then
        eval x env
    else
        eval y env

-- let n = x in y
eval (Let n x y) env@(vars, defs) =
    eval y ((n , eval x env):vars, defs)

eval (App func values) env = eval body $ expand env args values
    where (args, body) = extract func env

-- ([Variables], [Function definitions])
env :: ([(Name, Int)], [(Name, [Name], Exp)])
env = ([], funcs)

funcs = [
    ("pred",["N"], Bin "-" (Var "N") (Cst 1)),
    ("fact",["N"], Fi (Var "N")
        (Bin "*" (Var "N") (App "fact" [App "pred" [Var "N"]]))
        (Cst 1))]