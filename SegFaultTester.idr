import CFFI

-- a GlobalState record as main data structure
-- containing a List Nat and a Nat, both of 
-- which will always be empty (i.e. [], Z)

public export
record GlobalState where
    constructor MkGlobalState
    nl : List Nat
    abc : Nat

Show GlobalState where
  show gs = "GlobalState:, nl   :  " ++ (show (record {nl} gs)) ++ ", abc   :  " ++ (show (record {abc} gs))



getEmptyGlobalState : GlobalState
getEmptyGlobalState = MkGlobalState  [] Z

problematicFunction : IO (GlobalState)
problematicFunction = do
    let globalState = getEmptyGlobalState
    putStrLn (show globalState)
    let nlLength = length (record {nl} globalState)
    putStrLn (show nlLength)
    pure (globalState)

idrisFct : (globalState : GlobalState) -> IO Int 
idrisFct globalState = do
    problematicFunction
    pure 0




exporter : FFI_Export FFI_C "segFaultTester.h" []
exporter = Data GlobalState "GlobalState" $
           Fun getEmptyGlobalState "getEmptyGlobalState" $
           Fun idrisFct "idrisFct" $
           End
