//Codeunit "KNH Convert Blob" (ID 50616).

namespace KNHGenDev;
using Microsoft.Foundation.Company;
using System.Text;
using System.Utilities;
codeunit 50616 "KNH Convert Blob to B64 Text"
{
    TableNo = "Company Information";

    trigger OnRun()
    var
        SHRecordRef: RecordRef;
        MyFieldRef29: FieldRef;
        MyMessage: Text[1024];
    begin
        SHRecordRef.Open(Database::"Company Information");
        if SHRecordRef.FindFirst() then begin
            MyFieldRef29 := SHRecordRef.Field(29); //Assign work desc field in table
            MyMessage := Copystr(this.ConvertBlobToBase64String(MyFieldRef29), 1, 1024);
            Message(MyMessage);
        end;
    end;

    local procedure ConvertBlobToBase64String(pFieldRef29: FieldRef): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        varInStream: InStream;
    begin
        TempBlob.FromRecordRef(pFieldRef29.Record(), pFieldRef29.Number());
        TempBlob.CreateInStream(varInStream);
        exit(Base64Convert.ToBase64(varInStream));
    end;
}
