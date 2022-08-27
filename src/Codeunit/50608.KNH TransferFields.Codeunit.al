/// <summary>
/// Codeunit KNH TransferFields (ID 50608).
/// </summary>
codeunit 50608 "KNH TransferFields"
{
    trigger OnRun()
    begin
        TempSalesHeader.Init();
        TempSalesHeader.TransferFields(SalesHeader, true); //Primary Keys are changed --> Default = true
        NextNo := NoSeriesManagement.GetNextNo('S-ORD-1', WorkDate(), true);
        TempSalesHeader."No." := NextNo;
        TempSalesHeader."Document Type" := TempSalesHeader."Document Type"::Order;
        TempSalesHeader.Insert();
    end;

    var
        SalesHeader: Record "Sales Header";
        TempSalesHeader: Record "Sales Header" temporary;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NextNo: Code[20];
}
