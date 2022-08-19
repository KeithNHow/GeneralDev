/// <summary>
/// Codeunit KNH Loop Variations (ID 50605).
/// </summary>
codeunit 50605 "KNH Loop Variations"
{
    var
        Customer: Record Customer;
        Counter: Integer;
        I: Integer;
        J: Integer;
        A: array[5, 7] of Text[30];


    trigger OnRun()

    begin
        //For loop - First record unconditional
        for I := 1 to 5 do
            for J := 1 to 7 do
                A[I, J] := 'I' + Format(I) + 'J' + Format(J);
        Message('For loop ends at ' + Format(A[I, J]));

        //While loop - First record unconditional
        while I < 1000 do
            I := I + 1;
        Message('While loop ends at ' + Format(I));

        //Repeat loop - First record conditional
        Counter := 0;
        if Customer.find('-') then begin
            repeat
                Counter := Counter + 1;
            until Customer.Next() <= 0;
            Message('Repeat loop - Customer table contains %1 records.', Counter);
        end;
    end;
}