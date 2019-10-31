# segFaultInIdris
An example to invoke a segmentation fault in Idris


# Overview
I have 2 files, `main.c` and `SegFaultTester.idr`. The `main.c` file initalizes the Idris virtual machine and then repeatedly calls a dummy function in Idris that prints outs the length of an empty `List Nat`

After the 8838th iteration it aborts with a segmentation fault

A few points:
- This is the striped down version of a larger project where it aborts after the 15th iteration. 
- I don't want to add company code to this minimal example that proves the segfault
- The function is called with an instance of a GlobalState record `idrisFct(vm, global_state);`. Without this, it would not segFault.
- The number of putStrLn has an effect of when the segfault occurs
- Currently it only segfaults in `gdb` and as a direct call, but not when run with `valgrind`
- It segfaults on Ubuntu, but not on Mac. However, in a more complex environment (more variables, more putStrLn) it would also segfault on Mac
