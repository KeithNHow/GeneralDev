//Try methods are available from runtime version 2.0.
//The TryFunction attribute is used to mark a function as a try method.
//With Try attribute the function will not throw an exception if an error occurs.
//Message displayed is 'Something went wrong'.

namespace KNHGenDev;
codeunit 50627 "KNH Try Function"
{
    trigger OnRun()
    begin
        if this.MyTryMethod() then
            Message('Everything went well')
        else
            Message('Something went wrong')
    end;

    [TryFunction]
    local procedure MyTryMethod()
    begin
        Error('An error occurred during the operation');
    end;
}
