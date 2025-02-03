///Codeunit KNH DataTransfer (ID 50618).

namespace KNHGenDev;
using Microsoft.Foundation.AuditCodes;
codeunit 50618 "KNH Data Transfer"
{
    trigger OnRun()
    begin
        CopyFields();
        CopyRows();
    end;

    //Copy some values from Source Code table into the Description field of the KNHSource table. 
    //Copy the Description field in rows where the Code field contains an A.
    local procedure CopyFields()
    var
        KNHSource: Record "KNH Source";
        SourceCode: Record "Source Code";
        DataTfr: DataTransfer;
    begin
        DataTfr.SetTables(Database::"Source Code", Database::"KNH Source");
        DataTfr.AddFieldValue(SourceCode.FieldNo(Description), KNHSource.FieldNo(Name));
        DataTfr.AddSourceFilter(SourceCode.FieldNo(Description), '*%1*', 'A');
        DataTfr.AddJoin(SourceCode.FieldNo(Code), KNHSource.FieldNo(Code));
        DataTfr.CopyFields();
    end;

    //Copy the Code and Name fields in the Source Code table for all rows where Code field contains A. 
    //Add them as new rows in the KNH Source table. 
    //Use the AddConstantValue method to add 'X' to the Name field in the inserted rows.
    local procedure CopyRows()
    var
        KNHSource: Record "KNH Source";
        SourceCode: Record "Source Code";
        DataTfr: DataTransfer;
    begin
        DataTfr.SetTables(Database::"Source Code", Database::"KNH Source");
        DataTfr.AddFieldValue(SourceCode.FieldNo(Code), KNHSource.FieldNo(Code));
        DataTfr.AddFieldValue(SourceCode.FieldNo(Description), KNHSource.FieldNo(Name));
        DataTfr.AddSourceFilter(SourceCode.FieldNo(Code), '*%1*', 'A');
        DataTfr.AddConstantValue('X', KNHSource.FieldNo(Name));
        DataTfr.CopyRows();
    end;
}