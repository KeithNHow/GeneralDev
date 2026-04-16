/// <summary>
/// This codeunit transfers records from Sales header table to Temporary Sales Header table including values from primary key fields. 
/// </summary>
namespace KNHGenDev;
using Microsoft.Foundation.NoSeries;
using Microsoft.Sales.Document;

codeunit 50608 "KNH Transfer Fields"
{
    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
        TempSalesHeader: Record "Sales Header" temporary;
        NoSeries: Codeunit "No. Series";
        NextNo: Code[20];
    begin
        TempSalesHeader.Init();
        TempSalesHeader.TransferFields(SalesHeader, true); //Primary Keys are changed --> Default = true
        NextNo := NoSeries.GetNextNo('S-ORD-1', WorkDate(), true);
        TempSalesHeader."No." := NextNo;
        TempSalesHeader."Document Type" := TempSalesHeader."Document Type"::Order;
        TempSalesHeader.Insert();
    end;
}
