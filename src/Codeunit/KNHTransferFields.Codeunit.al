/// <summary>
/// Codeunit "KNH TransferFields" (ID 50608).
/// </summary>
Namespace KNHTest;
Using Microsoft.Sales.Document;
Using Microsoft.Foundation.NoSeries;

codeunit 50608 "KNH Transfer Fields"
{
    trigger OnRun()
    begin
        this.TempSalesHeader.Init();
        this.TempSalesHeader.TransferFields(this.SalesHeader, true); //Primary Keys are changed --> Default = true
        this.NextNo := this.NoSeriesManagement.GetNextNo('S-ORD-1', WorkDate(), true);
        this.TempSalesHeader."No." := this.NextNo;
        this.TempSalesHeader."Document Type" := this.TempSalesHeader."Document Type"::Order;
        this.TempSalesHeader.Insert();
    end;

    var
        SalesHeader: Record "Sales Header";
        TempSalesHeader: Record "Sales Header" temporary;
        NoSeriesManagement: Codeunit "No. Series";
        NextNo: Code[20];
}
