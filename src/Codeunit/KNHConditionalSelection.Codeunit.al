/// <summary>
/// Codeunit "KNH Conditional Selection" (ID 50602).
/// </summary>

namespace KNHGenDev;

codeunit 50602 "KNH Conditional Selection"
{
    trigger OnRun()
    var
        Amount: Decimal;
        I: Integer;
        J: Integer;
        Maximum: Integer;
    begin
        I := 10;
        J := 20;
        Amount := 500;
        if Amount < 1000 then begin
            if I > J then
                Maximum := I
            else
                Maximum := J;
            Amount := Amount * Maximum;
        end;
    end;
}
