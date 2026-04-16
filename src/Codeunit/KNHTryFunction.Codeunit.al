/// <summary>
/// The TryFunction attribute is used to mark a function as a try method. With the TryFunction attribute the function will not throw an exception if an error occurs. Message displayed is 'Something went wrong'.
/// </summary>
namespace KNHGenDev;

codeunit 50627 "KNH Try Function"
{
    trigger OnRun()
    begin
        if this.MyTryMethod() then
            Message('Process went well')
        else
            Message('Something went wrong')
    end;

    [TryFunction]
    local procedure MyTryMethod()
    begin
        Error('An error occurred during the operation');
    end;
}
