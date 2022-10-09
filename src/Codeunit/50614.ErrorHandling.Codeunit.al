/// <summary>
/// Codeunit "ErrorHandling" (ID 50614).
///ClearLastError Method	    Removes the last error message from memory.
///GetLastErrorCode Method	    Gets the classification of the last error that occurred.
///GetLastErrorObject Method	Gets the last System.Exception object that occurred.
///GetLastErrorText Method	    Gets the last error that occurred in the debugger.
/// </summary>
codeunit 50614 ErrorHandling
{
    var
        SalesInvHeader: Record "Sales Invoice Header";
        ErrorCode: Code[100];
        ErrorText: Text;

    trigger OnRun()
    begin
        if not SalesInvHeader.Find() then
            ErrorText := GetLastErrorText()
        else
            ErrorCode := CopyStr(GetLastErrorCode(), 1, 100);
    end;
}
