/// <summary>
/// Codeunit KNH Show Error (ID 50008).
/// </summary>
codeunit 50008 "KNH Show Error"
{
    trigger OnRun()
    begin
        ClearLastError();
        if not Codeunit.Run(Codeunit::"KNH Error") then
            Message('The last error was error Code: ' + GetLastErrorCode() + ' error text ' + GetLastErrorText());
    end;
}
