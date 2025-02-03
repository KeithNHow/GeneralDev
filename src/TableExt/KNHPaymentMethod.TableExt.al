namespace KNHGenDev;
using Microsoft.Bank.BankAccount;
tableextension 50600 "KNH Payment Method" extends "Payment Method"
{
    trigger OnBeforeDelete()
    var
        KNHRecordRef: Codeunit "KNH RecordRef";
        RecordRef: RecordRef;
    begin
        RecordRef.GetTable(Rec);
        KNHRecordRef.PreventDataDeletionIfUsed(RecordRef);
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnAfterDelete()
    begin
    end;
}