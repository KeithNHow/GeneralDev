/// <summary>
/// Codeunit "KNH_CopyTest (ID 50601).
/// Copies a specified record's filters, views, automatically calculated FlowFields, marks, fields, and keys.
/// </summary>

namespace KNHTest;
using Microsoft.Sales.Customer;

codeunit 50601 "KNH Copy Test"
{
    trigger OnRun()
    var
        Customer: Record Customer;
        Customer2: Record Customer;
        CustomerTxt: Label 'Customer No. is %1', Comment = '%1 = Customer2.No.';
    begin
        Customer.SetRange("No.", '10000');
        Customer2.Copy(Customer);
        Message(CustomerTxt, Customer2."No.");
    end;
}