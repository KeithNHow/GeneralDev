/// <summary>
/// Codeunit KNH ConditionalSelection (ID 50602).
/// </summary>
codeunit 50602 "KNH Conditional Selection"
{
    var
        Amount: Decimal;
        I: Integer;
        J: Integer;
        Maximum: Integer;

    trigger OnRun()
    begin
        I := 10;
        J := 20;
        if Amount < 1000 then begin
            if I > J then
                Maximum := I
            else
                Maximum := J;
            Amount := Amount * Maximum;
        end;
    end;
}
