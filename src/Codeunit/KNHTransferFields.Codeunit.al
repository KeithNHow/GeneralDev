/// <summary>
/// Codeunit "KNH TransferFields" (ID 50608).
/// </summary>
Namespace KNHGenDev;
Using Microsoft.Sales.Document;
Using Microsoft.Foundation.NoSeries;

codeunit 50608 "KNH Transfer Fields"
{
    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
        TempSalesHeader: Record "Sales Header" temporary;
        NoSeriesManagement: Codeunit "No. Series";
        NextNo: Code[20];
    begin
        TempSalesHeader.Init();
        TempSalesHeader.TransferFields(SalesHeader, true); //Primary Keys are changed --> Default = true
        NextNo := NoSeriesManagement.GetNextNo('S-ORD-1', WorkDate(), true);
        TempSalesHeader."No." := NextNo;
        TempSalesHeader."Document Type" := TempSalesHeader."Document Type"::Order;
        TempSalesHeader.Insert();
    end;
}
