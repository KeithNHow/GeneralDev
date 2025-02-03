//Codeunit "KNH Loop Variations" (ID 50605).

namespace KNHGenDev;
using Microsoft.Sales.Customer;

codeunit 50605 "KNH Loop Variations"
{
    trigger OnRun()
    var
        Customer: Record Customer;
        Counter: Integer;
        I: Integer;
        J: Integer;
        A: array[5, 7] of Text[30];
    begin
        //For loop - First record unconditional
        I := 1;
        for I := 1 to 5 do
            for J := 1 to 7 do
                A[I, J] := 'I' + Format(I) + 'J' + Format(J);
        Message('For loop ends at ' + Format(A[I, J]));

        //While loop - First record unconditional
        I := 0;
        while I < 1000 do
            I := I + 1;
        Message('While loop ends at ' + Format(I));

        //Repeat loop - First record conditional
        Counter := 0;
        if Customer.FindSet() then begin
            repeat
                Counter := Counter + 1;
            until Customer.Next() <= 0;
            Message('Repeat loop - Customer table contains %1 records.', Counter);
        end;
    end;
}