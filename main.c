#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "segFaultTester.h"

VM *vm = NULL;
GlobalState global_state = NULL;

/// try to start the idris vm
bool initialize_idris()
{
    if (vm == NULL)
    {
        vm = idris_vm();
        if (vm == NULL)
        {
            return false;
        }
    }

    global_state = getEmptyGlobalState(vm);
    return true;
}

/// access messages to be dispatched
void testSegFault()
{

    for (int k = 0; k < 50000; k++)
    {

        // should segFault after the 8838th iteration
        idrisFct(vm, global_state);
    }
    return;
}

int main(int argc, char **argv)
{

    initialize_idris();
    testSegFault();
    close_vm(vm);
}
