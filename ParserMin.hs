{-# OPTIONS_GHC -w #-}
module ParserMin where
import LexerMin
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,91) ([6560,8192,0,2048,0,4032,0,40960,25,0,0,4096,6560,0,4034,6560,40960,25,6560,40960,25,6560,40960,25,8192,40960,25,49152,5,1472,49152,5,0,0,1,256,6560,0,20416,0,32,0,6560,0,4036,49216,40975,25,6560,0,0,49152,15,4032,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Exp","Exps","let","in","int","if","then","else","var","func","\"=\"","\"+\"","\"-\"","\"*\"","\"<=\"","\"+=\"","\">=\"","\"(\"","\")\"","\",\"","%eof"]
        bit_start = st * 24
        bit_end = (st + 1) * 24
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..23]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (6) = happyShift action_2
action_0 (8) = happyShift action_4
action_0 (9) = happyShift action_5
action_0 (12) = happyShift action_6
action_0 (13) = happyShift action_7
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (6) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (12) = happyShift action_16
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (15) = happyShift action_10
action_3 (16) = happyShift action_11
action_3 (17) = happyShift action_12
action_3 (18) = happyShift action_13
action_3 (19) = happyShift action_14
action_3 (20) = happyShift action_15
action_3 (24) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_10

action_5 (6) = happyShift action_2
action_5 (8) = happyShift action_4
action_5 (9) = happyShift action_5
action_5 (12) = happyShift action_6
action_5 (13) = happyShift action_7
action_5 (4) = happyGoto action_9
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_11

action_7 (21) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (6) = happyShift action_2
action_8 (8) = happyShift action_4
action_8 (9) = happyShift action_5
action_8 (12) = happyShift action_6
action_8 (13) = happyShift action_7
action_8 (4) = happyGoto action_25
action_8 (5) = happyGoto action_26
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (10) = happyShift action_24
action_9 (15) = happyShift action_10
action_9 (16) = happyShift action_11
action_9 (17) = happyShift action_12
action_9 (18) = happyShift action_13
action_9 (19) = happyShift action_14
action_9 (20) = happyShift action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (6) = happyShift action_2
action_10 (8) = happyShift action_4
action_10 (9) = happyShift action_5
action_10 (12) = happyShift action_6
action_10 (13) = happyShift action_7
action_10 (4) = happyGoto action_23
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (6) = happyShift action_2
action_11 (8) = happyShift action_4
action_11 (9) = happyShift action_5
action_11 (12) = happyShift action_6
action_11 (13) = happyShift action_7
action_11 (4) = happyGoto action_22
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (6) = happyShift action_2
action_12 (8) = happyShift action_4
action_12 (9) = happyShift action_5
action_12 (12) = happyShift action_6
action_12 (13) = happyShift action_7
action_12 (4) = happyGoto action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (6) = happyShift action_2
action_13 (8) = happyShift action_4
action_13 (9) = happyShift action_5
action_13 (12) = happyShift action_6
action_13 (13) = happyShift action_7
action_13 (4) = happyGoto action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (6) = happyShift action_2
action_14 (8) = happyShift action_4
action_14 (9) = happyShift action_5
action_14 (12) = happyShift action_6
action_14 (13) = happyShift action_7
action_14 (4) = happyGoto action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (6) = happyShift action_2
action_15 (8) = happyShift action_4
action_15 (9) = happyShift action_5
action_15 (12) = happyShift action_6
action_15 (13) = happyShift action_7
action_15 (4) = happyGoto action_18
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (14) = happyShift action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (6) = happyShift action_2
action_17 (8) = happyShift action_4
action_17 (9) = happyShift action_5
action_17 (12) = happyShift action_6
action_17 (13) = happyShift action_7
action_17 (4) = happyGoto action_30
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (15) = happyShift action_10
action_18 (16) = happyShift action_11
action_18 (17) = happyShift action_12
action_18 (19) = happyShift action_14
action_18 _ = happyReduce_7

action_19 (15) = happyShift action_10
action_19 (16) = happyShift action_11
action_19 (17) = happyShift action_12
action_19 (19) = happyShift action_14
action_19 _ = happyReduce_6

action_20 (15) = happyShift action_10
action_20 (16) = happyShift action_11
action_20 (17) = happyShift action_12
action_20 (19) = happyShift action_14
action_20 _ = happyReduce_5

action_21 _ = happyReduce_4

action_22 (17) = happyShift action_12
action_22 _ = happyReduce_3

action_23 (17) = happyShift action_12
action_23 _ = happyReduce_2

action_24 (6) = happyShift action_2
action_24 (8) = happyShift action_4
action_24 (9) = happyShift action_5
action_24 (12) = happyShift action_6
action_24 (13) = happyShift action_7
action_24 (4) = happyGoto action_29
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (15) = happyShift action_10
action_25 (16) = happyShift action_11
action_25 (17) = happyShift action_12
action_25 (18) = happyShift action_13
action_25 (19) = happyShift action_14
action_25 (20) = happyShift action_15
action_25 (23) = happyShift action_28
action_25 _ = happyReduce_12

action_26 (22) = happyShift action_27
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_9

action_28 (6) = happyShift action_2
action_28 (8) = happyShift action_4
action_28 (9) = happyShift action_5
action_28 (12) = happyShift action_6
action_28 (13) = happyShift action_7
action_28 (4) = happyGoto action_25
action_28 (5) = happyGoto action_33
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (11) = happyShift action_32
action_29 (15) = happyShift action_10
action_29 (16) = happyShift action_11
action_29 (17) = happyShift action_12
action_29 (18) = happyShift action_13
action_29 (19) = happyShift action_14
action_29 (20) = happyShift action_15
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (7) = happyShift action_31
action_30 (15) = happyShift action_10
action_30 (16) = happyShift action_11
action_30 (17) = happyShift action_12
action_30 (18) = happyShift action_13
action_30 (19) = happyShift action_14
action_30 (20) = happyShift action_15
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (6) = happyShift action_2
action_31 (8) = happyShift action_4
action_31 (9) = happyShift action_5
action_31 (12) = happyShift action_6
action_31 (13) = happyShift action_7
action_31 (4) = happyGoto action_35
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (6) = happyShift action_2
action_32 (8) = happyShift action_4
action_32 (9) = happyShift action_5
action_32 (12) = happyShift action_6
action_32 (13) = happyShift action_7
action_32 (4) = happyGoto action_34
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_13

action_34 (15) = happyShift action_10
action_34 (16) = happyShift action_11
action_34 (17) = happyShift action_12
action_34 (18) = happyShift action_13
action_34 (19) = happyShift action_14
action_34 (20) = happyShift action_15
action_34 _ = happyReduce_8

action_35 (15) = happyShift action_10
action_35 (16) = happyShift action_11
action_35 (17) = happyShift action_12
action_35 (18) = happyShift action_13
action_35 (19) = happyShift action_14
action_35 (20) = happyShift action_15
action_35 _ = happyReduce_1

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "+" happy_var_1 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "-" happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "*" happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "<=" happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "+=" happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin ">=" happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 6 4 happyReduction_8
happyReduction_8 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFunc happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Func happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_1  4 happyReduction_10
happyReduction_10 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn4
		 (Cst happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  4 happyReduction_11
happyReduction_11 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  5 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([ happy_var_1]
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  5 happyReduction_13
happyReduction_13 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 :happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 24 24 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TLet -> cont 6;
	TIn -> cont 7;
	TInt happy_dollar_dollar -> cont 8;
	TIf -> cont 9;
	TThen -> cont 10;
	TElse -> cont 11;
	TVar happy_dollar_dollar -> cont 12;
	TFunc happy_dollar_dollar -> cont 13;
	TSym "=" -> cont 14;
	TSym "+" -> cont 15;
	TSym "-" -> cont 16;
	TSym "*" -> cont 17;
	TSym "<=" -> cont 18;
	TSym "+=" -> cont 19;
	TSym ">=" -> cont 20;
	TSym "(" -> cont 21;
	TSym ")" -> cont 22;
	TSym "," -> cont 23;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 24 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

-- Définition du type Exp utilisé pour construire l'arbre syntaxique.
data Exp = Let Name Exp Exp | Bin [Char] Exp Exp | Cst Int | Var Name | If Exp Exp Exp | Func Name [Exp] deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8814_0/ghc_2.h" #-}




























































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
