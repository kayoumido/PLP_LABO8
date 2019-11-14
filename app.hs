module Lab8 where


type Op = Char
type Name = [Char]
data Exp = Cnst Int | Bin Op Exp Exp  | Un Op Exp | Cond Exp Exp Exp | Var Name | Let Name Exp Exp  deriving (Show)

value v [] = error $ v ++ " not found (value)"
value v ((var, val):env) =
    if v == var then val else value v env

eval (Cnst n) _         = n
eval (Var v) env        = value v env

eval (Bin '+' a b) env  = (eval a env) + (eval b env)
eval (Bin '<' a b) env  = if (eval a env) < (eval b env) then 1 else 0

eval (Un '-' a) env     = - eval a env

eval (Cond p ifTrue ifFalse) env
    | eval p  env == 1  = eval ifTrue env
    | otherwise         = eval ifFalse env

eval (Let n x y) env = eval y ((n, eval x env):env)

condOk = (Bin '+' (Cnst 1) (Cnst 5))
condNotOk = (Bin '+' (Cnst 5) (Cnst 5)) 
plusPetit = (Bin '<' (Cnst 5) (Cnst 2))

env :: [(Name, Int)]
env = [("a", 1), ("b", 2), ("c", 3)]