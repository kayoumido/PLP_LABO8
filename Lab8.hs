module Lab8 where

import  Data.Char

type Op   = [Char]
type Name = [Char]

data Exp =
  Cst Int
  | Bin Op Exp Exp
  | Un Op Exp
  | If Exp Exp Exp
  | Var Name
  | Let Name Exp Exp
  | Func Name [Exp]
  | Def Name [Name] Exp
  deriving (Show)


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

-- Function to define a boolean function
bool op x y =
  if (op x y)
    then 1
    else 0

-- Expand an evironment w/ new variables
expand env [] [] = env
expand env (v:vs) (x:xs) = ((v, eval x env) : vars, funcs)
  where
    (vars, funcs) = expand env vs xs

eval (Cst n) _ = n
eval (Var v) env = value v env

eval (Bin "+" a b) env = (eval a env) + (eval b env)
eval (Bin "-" a b) env = (eval a env) - (eval b env)
eval (Bin "*" a b) env = (eval a env) * (eval b env)

eval (Bin "<" a b) env  = bool (<) (eval a env) (eval b env)
eval (Bin "<=" a b) env = bool (<=) (eval a env) (eval b env)

eval (Un "-" a) env = - eval a env

eval (If p ifTrue ifFalse) env
  | eval p env < 1 = eval ifFalse env
  | otherwise = eval ifTrue env

eval (Let n x y) env@(vars, funcs) = eval y ((n, eval x env) : vars, funcs)

eval (Func func xs) env = eval body $ expand env vars xs
  where
    (vars, body) = extract func env

-- Lexer
lexer [] = []
lexer (c:cs)
    | isSpace c = lexer cs
    | isUpper c = lexFunc (c:cs)
    | isLower c = lexVar (c:cs)
--    | isAlpha c = lexSym (c:cs)
    | isDigit c = lexInt (c:cs)

lexer ('<':'=':cs) = "<=": lexer cs -- <- C MOA KA FÉ (DODO)
lexer ('<':cs) = "<": lexer cs
lexer ('-':cs) = "-": lexer cs
lexer ('+':cs) = "+": lexer cs
lexer ('=':cs) = "=": lexer cs

-- extract digits
lexInt cs = int : lexer rest
    where (int, rest) = span isDigit cs

-- extract symbole
lexSym cs = symbol : lexer rest
    where (symbol,rest) = span isAlpha cs

-- extract Function name
lexFunc cs = char : lexer rest
  where (char, rest) = span isAlpha cs

-- extract Variable name
lexVar cs = char : lexer rest
  where (char, rest) = span isAlpha cs

-- Function definition
funcs = [
    ("Succ", ["N"], Bin "+" (Var "N") (Cst 1)),
    ("Pred", ["N"], Bin "-" (Var "N") (Cst 1)),
    ("Geoseries", ["N"],
        If (Var "N")
            (Bin "+" (Var "N") (Func "Geoseries" [Func "Pred" [Var "N"]]))
            (Cst 0)
        ),
    ("Fact", ["N"],
        If (Var "N")
            (Bin "*" (Var "N") (Func "Fact" [Func "Pred" [Var "N"]]))
            (Cst 1)
        )
    ]

-- Creat a enviroment
env :: ([(Name, Int)], [(Name, [Name], Exp)])
env = ([("a", 1), ("b", 2), ("c", 3)], funcs)

-- TEST --
plusPetit = (Bin "<" (Cst 5) (Cst 2))

