/// <summary>
/// Codeunit KNH TransferFields (ID 50608).
/// </summary>
codeunit 50608 "KNH TransferFields"
{
    trigger OnRun()
    begin
        SalesHeader2.Init();
        SalesHeader2.TransferFields(SalesHeader, true); //Primary Keys are changed --> Default = true
        NextNo := NoSeriesManagement.GetNextNo('S-ORD-1', WorkDate(), true);
        SalesHeader2."No." := NextNo;
        SalesHeader2."Document Type" := SalesHeader2."Document Type"::Order;
        SalesHeader2.Insert();
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesHeader2: Record "Sales Header" temporary;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NextNo: Code[20];
}
