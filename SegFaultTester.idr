import CFFI

-- some data structures
-- SubDataElement containing a List
-- Main Data Structure containing a SubDataElement



public export
record GlobalState where
    constructor MkGlobalState
    nl : List Nat
    abc : Nat

Show GlobalState where
  show gs = "GlobalState:, nl   :  " ++ (show (record {nl} gs)) ++ ", abc   :  " ++ (show (record {abc} gs))



getEmptyGlobalState : GlobalState
getEmptyGlobalState = MkGlobalState  [] Z -- emptyOutbox [] []

problematicFunction : IO (GlobalState)
problematicFunction = do
    let globalState = getEmptyGlobalState
    putStrLn (show globalState)
    let listChannelMessagesLength = length (record {nl} globalState)
    putStrLn (show listChannelMessagesLength)
    pure (globalState)

idrisFct : (globalState : GlobalState) -> IO Int 
idrisFct globalState = do
    problematicFunction
    pure 0




consumer : FFI_Export FFI_C "segFaultTester.h" []
consumer = Data GlobalState "GlobalState" $
           Fun getEmptyGlobalState "getEmptyGlobalState" $
           Fun idrisFct "idrisFct" $
           End
