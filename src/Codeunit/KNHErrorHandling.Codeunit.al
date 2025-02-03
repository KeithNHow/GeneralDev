/// <summary>
/// Codeunit "KNH Error Handling" (ID 50614).
///ClearLastError Method	    Removes the last error message from memory.
///GetLastErrorCode Method	    Gets the classification of the last error that occurred.
///GetLastErrorObject Method	Gets the last System.Exception object that occurred.
///GetLastErrorText Method	    Gets the last error that occurred in the debugger.
/// </summary>

namespace KNHGenDev;
using Microsoft.Sales.History;

codeunit 50614 "KNH Error Handling"
{
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        ErrorCode: Code[100];
        ErrorText: Text;

    trigger OnRun()
    begin
        if not this.SalesInvoiceHeader.Find() then
            this.ErrorText := GetLastErrorText()
        else begin
            this.ErrorCode := CopyStr(GetLastErrorCode(), 1, 100);
            Message(this.ErrorCode);
        end;
    end;
}
