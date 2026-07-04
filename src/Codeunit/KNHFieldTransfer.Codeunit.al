///<Summary>
///Codeunit finds all Invoice records in SalesHeader table. It then gets NoSeries record using record from S+R Setup table. SalesHeader records looped through and SalesInvHdr record created. No. field updated for each one using GetNextNo procedure from NoSeriesMgmt codeunit. Transferfields method used to transfer other data from SalesHdr record. PK fields not updated. After loop message states how many records created.
///</Summary>
namespace KNHGenDev;
using Microsoft.Foundation.NoSeries;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;
using Microsoft.Sales.Setup;

codeunit 50617 "KNH Field Transfer"
{
    trigger OnRun()
    var
        NoSeries: Record "No. Series";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        NoSeriesManagement: Codeunit "No. Series";
        Counter: Integer;
        UpdateCompleteMsg: Label 'The number of Sales Invoice records created = %1', Comment = '%1 = Counter';
    begin
        SalesHeader.SetRange(Invoice);
        if SalesHeader.FindSet() then begin
            if not SalesReceivablesSetup.findfirst() or (SalesReceivablesSetup."Invoice Nos." = '') then
                exit;
            NoSeries.Get(SalesReceivablesSetup."Invoice Nos.");
            repeat
                SalesInvoiceHeader.Init();
                SalesInvoiceHeader."No." := NoSeriesManagement.GetNextNo(SalesReceivablesSetup."Invoice Nos.", WorkDate(), true);
                SalesInvoiceHeader.TransferFields(SalesHeader, false);
                SalesInvoiceHeader.Insert();
                Counter += 1;
            until SalesHeader.Next() = 0;
        end;
        Message(UpdateCompleteMsg, Counter);
    end;
}
