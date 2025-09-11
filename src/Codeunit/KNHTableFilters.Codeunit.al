//Codeunit "KNH Table Filters" (ID 50614).

namespace KNHGenDev;
using Microsoft.Sales.Document;

codeunit 50615 "KNH Table Filters"
{
    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
        Counter: Integer;
        CountMsg: Label 'Records counted = %1', Comment = '%1 = Counter';
        Name: Text;
    begin
        #region
        Name := 'Teddy';
        SalesHeader.Reset();
        SalesHeader.SetLoadFields("Document Type", "No.", "Sell-to Customer Name"); //Only need these fields
        SalesHeader.SetCurrentKey("Document Type", "No.");
        SalesHeader.SetFilter("Document Type", '%1|%2', 2, 3);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        SalesHeader.SetFilter("Sell-to Customer Name", '@' + Name + '*'); //find Cust acc with name, ignore case
        if SalesHeader.FindSet() then begin
            repeat
                Counter += 1;
            until SalesHeader.Next() = 0;
            Message(CountMsg, Counter);
        end;
        #endregion
    end;
}
