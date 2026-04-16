/// <summary>
/// Codeunit to rename source code and source code lines for KNH GenDev.
/// </summary>

namespace KNHGenDev;

codeunit 50619 "KNH Rename"
{
    TableNo = "KNH Source";

    trigger OnRun()
    var
        KNHSourceLine: Record "KNH Source Line";
    begin
        Rec.Get('CODETWO');
        Rec.Rename('CODATWO');
        KNHSourceLine.SetRange("Source Code", 'CODETWO');
        if KNHSourceLine.FindSet(true) then
            repeat
                KNHSourceLine.Rename(KNHSourceLine.Code, 'CODATWO');
            until KNHSourceLine.Next() = 0;
    end;
}
