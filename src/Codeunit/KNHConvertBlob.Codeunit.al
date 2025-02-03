//Codeunit "KNH Convert Blob" (ID 50616).

namespace KNHGenDev;
using Microsoft.Foundation.Company;
using System.Text;
using System.Utilities;
codeunit 50616 "KNH Convert Blob"
{
    TableNo = "Company Information";

    trigger OnRun()
    var
        CRecordRef: RecordRef;
        FieldRef29: FieldRef;
    begin
        FieldRef29 := CRecordRef.Field(29); //Assign Picture field in table
        this.ConvertBlobToBase64String(FieldRef29);
    end;

    local procedure ConvertBlobToBase64String(var pFieldRef: FieldRef): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        varInStream: InStream;
    begin
        TempBlob.FromRecordRef(pFieldRef.Record(), pFieldRef.Number());
        TempBlob.CreateInStream(varInStream);
        exit(Base64Convert.ToBase64(varInStream));
    end;
}
