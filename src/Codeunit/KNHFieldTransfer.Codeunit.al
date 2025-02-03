// Codeunit "KNH FieldTransfer" (ID 50617).

namespace KNHGenDev;
using Microsoft.Foundation.NoSeries;
using Microsoft.Sales.Document;
using Microsoft.Sales.Setup;
using Microsoft.Sales.History;

codeunit 50617 "KNH Field Transfer"
{
    trigger OnRun()
    var
        NoSeries: Record "No. Series";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        NoSeriesManagement: Codeunit "No. Series";
    begin
        SalesHeader.SetRange(Invoice);
        if SalesHeader.FindSet() then begin
            NoSeries.Get(SalesReceivablesSetup."Invoice Nos.");
            repeat
                SalesInvoiceHeader.Init();
                SalesInvoiceHeader."No." := NoSeriesManagement.GetNextNo(SalesReceivablesSetup."Invoice Nos.", WorkDate(), true);
                SalesInvoiceHeader.TransferFields(SalesHeader, false);
                SalesInvoiceHeader.Insert();
            until SalesHeader.Next() = 0;
        end;
    end;
}
