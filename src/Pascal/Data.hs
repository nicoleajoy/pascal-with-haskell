-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Pascal.Data
    (
        VarDecBlock(..),
        VarDec(..),
        Type(..),
        Exp(..),
        BoolExp(..),
        Statement(..),
        CaseLabel(..),
        WriteParam(..),
        Program
    ) where

data VarDecBlock = 
    VarDecBlock [VarDec]

data VarDec =
    VarDec [String] Type
    | VarDef_Float String Float
    | VarDef_True String
    | VarDef_False String

data Type = BOOLEAN | REAL

data Exp = 
    -- unary operator: Op name expression
    Op1 String Exp
    -- binary operator: Op name leftExpression rightExpression
    | Op2 String Exp Exp
    | Op3 String Exp
    -- function call: FunctionCall name ListArguments
    | FunCall String [Exp]
    -- real value: e.g. Real 1.0
    | Real Float
    -- variable: e.g. Var "x"
    | Var_R String

data BoolExp = 
    -- operator on boolean expressions
    OpB String BoolExp BoolExp
    -- negation, the only unary operator
    | Not BoolExp
    -- operator on real expressions
    | OpR String Exp Exp
    -- true and false constants
    | True_C 
    | False_C
    -- variable: e.g. Var "x"
    | Var_B String

data Statement = 
    AssignR String Exp
    | AssignB String BoolExp
    | IfThen BoolExp Statement
    | IfThenElse BoolExp Statement Statement
    | WhileDo BoolExp [Statement]
    | ForDo String Float Float [Statement]
    | Case Exp [CaseLabel]
    | WriteNewLine
    | WriteInside [WriteParam]
    | Func String String [VarDec] String Statement String
    | Proc String String [VarDec] String Statement String

data CaseLabel = 
    CaseLabel Exp Statement

data WriteParam = 
    PrintID String
    | PrintTrue
    | PrintFalse
    | PrintFloat Float
    | PrintString String

-- Data-structure for whole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = [Statement]
