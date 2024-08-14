codeunit 50624 "KNH Use Standard Error"
{
    trigger OnRun()
    begin
        UseStandardError();
    end;

    local procedure UseStandardError()
    var
        ErrorMessageHandler: Codeunit "Error Message Handler";
        ErrorMessageManagement: Codeunit "Error Message Management";
    begin
        ErrorMessageManagement.Activate(ErrorMessageHandler);
        ErrorMessageManagement.LogSimpleErrorMessage('Error in process one!');
        ErrorMessageManagement.LogSimpleErrorMessage('Error in process two!');

        if ErrorMessageHandler.ShowErrors() then
            Error('');
    end;
}