/// <summary>
/// The codeunit demonstrates how to use the DataTransfer class to copy data from one table to another.
/// It contains two methods, CopyFields and CopyRows, which are called in the OnRun trigger.
/// </summary>

namespace KNHGenDev;
using Microsoft.Foundation.AuditCodes;
codeunit 50618 "KNH Data Transfer"
{
    trigger OnRun()
    begin
        this.CopyFields();
        this.CopyRows();
    end;

    //Transfers the data from the Name field in the KNH Source table to the Description field in the Source Code table for all rows where Code field contains A.
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

    //Transfers the data from the Code and Name fields in the Source Code table to the Code and Name fields in the KNH Source table for all rows where Code field contains A.   
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