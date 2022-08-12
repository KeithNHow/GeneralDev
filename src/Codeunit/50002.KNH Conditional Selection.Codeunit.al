/// <summary>
/// Codeunit KNH ConditionalSelection (ID 50001).
/// </summary>
codeunit 50002 "KNH Conditional Selection"
{
    var
        Amount: Decimal;
        I: Integer;
        J: Integer;
        Maximum: Integer;

    trigger OnRun()
    begin
        if Amount < 1000 then begin
            if I > J then
                Maximum := I
            else
                Maximum := J;
            Amount := Amount * Maximum;
        end;
    end;
}
