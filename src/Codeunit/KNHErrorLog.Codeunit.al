/// <summary>
/// Codeunit "KNH_ErrorLog" (ID 50621).
/// </summary>

namespace KNHGenDev;
Using Microsoft.Sales.Customer;

codeunit 50621 "KNH Error Log"
{
    TableNo = "KNH Error Log";

    trigger OnRun()
    begin
        Rec.Init();
        Rec."Entry No." := Rec.GetLastEntryNo() + 1;
        Rec."Table No." := 18;
        Rec."Record No." := 'BCW';
        Rec."Error Code" := 'MissingEmailaddr';
        Rec."Error Text" := 'Email address missing for customer.';
        Rec.Insert();
    end;
}
