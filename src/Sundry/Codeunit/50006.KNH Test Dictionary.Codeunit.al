/// <summary>
/// Codeunit Dictionary (ID 50006)
/// </summary>
codeunit 50006 "KNH Test Dictionary"
{
    trigger OnRun()
    begin
        CountCharactersInCustomerName();
    end;
    /// <summary>
    /// CountCharactersInCustomerName.
    /// </summary>
    local procedure CountCharactersInCustomerName()
    var
        customerName: Text;
        counter: Dictionary of [Char, Integer];
        c: Integer;
        i: Integer;
    begin
        customerName := 'Colosseum Dental Ltd'; //string length = 20
        for i := 1 to StrLen(customerName) do begin //loop from 1 to 20
            if counter.Get(customerName[i], c) then
                counter.Set(customerName[i], c + 1)
            else
                counter.Add(customerName[i], 1);
        end;
        Message('Characters of type s in Customer Name = ' + Format(counter.Get(customerName[4])));
    end;
}
