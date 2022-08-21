/// <summary>
/// Codeunit KNH Username List (ID 50606).
/// </summary>
codeunit 50606 "KNH List"
{
    var
        Names: List of [Text];

    trigger OnRun()

    begin
        //List
        Names.Insert(1, 'James');
        Names.Insert(2, 'John');
        Names.Insert(3, 'Jack');
        Names.Insert(4, 'Jim');
        PrintCustomerNames(Names); //local procedure foreach loop
        NumberCount(); //local procedure for loop
        NumberCount2(0); //local procedure while loop
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
        for I := 1 to 1000 do
            Total[I] := I * 3;
        Message('For loop - Array(1000) = ' + Format(Total[I]))
    end;

    /// <summary>
    /// NumberCount2
    /// </summary>
    /// <returns>Return value of type Integer</returns>
    local procedure NumberCount2(Counter: Integer)
    begin
        while Counter < 1000 do begin
            Counter := Counter + 1;
            message('While loop - ' + FORMAT(Counter));
            if Counter = 5 then
                break;
        end;
    end;
}
