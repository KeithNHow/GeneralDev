namespace KNHGenDev;

codeunit 50602 "KNH Conditional Selection"
{
    trigger OnRun()
    var
        Amount: Decimal;
        I: Integer;
        J: Integer;
        Maximum: Integer;
        Result: Decimal;
        MyMessageLbl: Label 'Result is %1', Comment = '%1 = Result';
    begin
        I := 10;
        J := 20;
        Amount := 500;
        if Amount < 1000 then begin
            if I > J then
                Maximum := I
            else
                Maximum := J;
            Result := Amount * Maximum; //520
            Message(MyMessageLbl, Result);
        end;
    end;
}
