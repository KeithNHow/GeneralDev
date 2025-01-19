//Try methods are available from runtime version 2.0.
//Specifies the method to be a try method, which can be used to catch and handle errors.

namespace KNHTest;
codeunit 50627 "KNH Try Function"
{
    trigger OnRun()
    begin
        if this.MyTryMethod() then
            message('Everything went well')
        else
            message('Something went wrong')
    end;

    [TryFunction]
    local procedure MyTryMethod()
    begin
        error('An error occurred during the operation');
    end;
}
