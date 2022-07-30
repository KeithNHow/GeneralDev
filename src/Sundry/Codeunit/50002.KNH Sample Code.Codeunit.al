/// <summary>
/// Codeunit SampleCode
/// Selection, Iteration 
/// </summary>
codeunit 50002 "KNH Sample Code"
{
    var
        Counter: Integer;

    trigger OnRun()

    var
        Customer: Record Customer;
        WhoAmI: Code[20];
        Amount: Decimal;
        A: array[5, 7] of Text[30];
        I: Integer;
        J: Integer;
        Maximum: Integer;
        Names: List of [Text];

    begin
        //Conditional selection
        if Amount < 1000 then begin
            if I > J then
                Maximum := I
            else
                Maximum := J;
            Amount := Amount * Maximum;
        end;

        //Case selection
        WhoAmI := 'Mark';
        case WhoAmI of
            'Keith':
                begin
                    I := 10;
                    J := 20;
                    message('Keith your score is ' + format(I * J));
                end;
            'Mark':
                begin
                    I := 5;
                    J := 4;
                    message('Mark your score is ' + format(I * J));
                end;
            'Paul':
                begin
                    I := 30;
                    J := 50;
                    message('Paul your score is ' + format(I * J));
                end;
            else
                Message('Case has failed, no name found.');
        end;

        //For loop - First record unconditional
        for I := 1 to 5 do
            for J := 1 to 7 do
                A[I, J] := 'I' + Format(I) + 'J' + Format(J);
        message('For loop ends at ' + Format(A[I, J]));

        //While loop - First record unconditional
        while I < 1000 do
            I := I + 1;
        message('while loop ends at ' + Format(I));

        //Repeat loop - First record conditional
        Counter := 0;
        if Customer.find('-') then begin
            repeat
                Counter := Counter + 1;
            until Customer.next <= 0;
            message('Repeat loop - Customer table contains %1 records.', Counter);
        end;

        //List
        Names.Insert(1, 'James');
        Names.Insert(2, 'John');
        Names.Insert(3, 'Jack');
        Names.Insert(4, 'Jim');
        PrintCustomerNames(Names); //local procedure foreach loop
        NumberCount(); //local procedure for loop
        NumberCount2(Counter); //local procedure while loop
    end;

    /// <summary>
    /// PrintCustomerNames from list
    /// </summary>
    /// <param name="CustomerNames">List of [Text].</param>
    local procedure PrintCustomerNames(CustomerNames: List of [Text]);
    var
        CustomerName: Text;
    begin
        foreach CustomerName in CustomerNames do
            message('Foreach loop - Customer Name = ' + CustomerName);
    end;

    /// <summary>
    /// NumberCount
    /// </summary>
    /// <returns>Return value of type Integer</returns>
    local procedure NumberCount()
    Var
        I: Integer;
        Total: array[1000] of Decimal;

    begin
        for I := 1 to 1000 do begin
            Total[I] := I * 3;
        end;
        Message('For loop - Array(50) = ' + Format(Total[50]))
    end;

    /// <summary>
    /// NumberCount2
    /// </summary>
    /// <returns>Return value of type Integer</returns>
    local procedure NumberCount2(Counter: Integer)
    begin
        Counter := 0;
        while Counter < 1000 do begin
            Counter := Counter + 1;
            message('While loop - ' + FORMAT(Counter));
            if Counter = 5 then
                break;
        end;
    end;
}