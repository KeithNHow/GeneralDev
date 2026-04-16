///<summary>
/// Converts a BLOB field to a Base64 encoded text string.
///</summary>

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
        MyFieldRef: FieldRef;
        MyMessage: Text[1024];
    begin
        SHRecordRef.Open(Database::"Company Information");
        if SHRecordRef.FindFirst() then begin
            MyFieldRef := SHRecordRef.Field(200); //Assign shortcut Dim 1 code 
            MyMessage := CopyStr(this.ConvertBlobToBase64String(MyFieldRef), 1, 1024);
            Message(MyMessage);
        end;
    end;

    local procedure ConvertBlobToBase64String(pFieldRef: FieldRef): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        varInStream: InStream;
        WorkDesc: Text[1024];
    begin
        TempBlob.FromRecordRef(pFieldRef.Record(), pFieldRef.Number());
        TempBlob.CreateInStream(varInStream);
        WorkDesc := CopyStr(Base64Convert.ToBase64(varInStream), 1, 1024);
        exit(WorkDesc);
    end;
}
