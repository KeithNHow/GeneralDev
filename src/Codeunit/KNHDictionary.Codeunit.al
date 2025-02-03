/// <summary>
/// Codeunit KNH Dictionary (ID 50607)
/// REPRESENTS AN UNORDERED COLLECTION OF KEYS AND VALUES. The Dictionary data type is optimized for fast lookup of values.
/// Add(TKey, TValue) - Adds the specified key and value to the dictionary.
/// ContainsKey(TKey) - Determines whether the Dictionary contains the specified key.
/// Count()	- Gets the number of key/value pairs contained in the Dictionary.
/// Get(TKey, var TValue) - Gets the value associated with the specified key.
/// Get(TKey) - Gets the value associated with the specified key.
/// Keys() - Gets a collection containing the keys in the Dictionary.
/// Remove(TKey) - Removes the value with the specified key from the Dictionary.
/// Set(TKey, TValue) - Sets the value associated with the specified key.
/// Set(TKey, TValue, var TValue) - Sets the value associated with the specified key.
/// Values() - Gets a collection containing the values in the Dictionary.
/// </summary>

namespace KNHGenDev;
using Microsoft.Sales.Customer;
codeunit 50607 "KNH Dictionary"
{
    trigger OnRun()
    begin
        this.CountUniqueCharsInCustomerName();
        this.DisplayCustomerName();
    end;
    /// <summary>
    /// CountCharactersInCustomerName.
    /// </summary>
    local procedure CountUniqueCharsInCustomerName()
    var
        Counter: Dictionary of [Char, Integer];
        C: Integer;
        I: Integer;
        CustomerName: Text;
    begin
        CustomerName := 'Colosseum Dental Ltd'; //String length = 20
        for I := 1 to StrLen(CustomerName) do //Loop from 1 to 20
            if Counter.Get(CustomerName[I], C) then //Does char exist in dictionary
                Counter.Set(CustomerName[I], C + 1) //Add 1 to dictionary cell 
            else
                Counter.Add(CustomerName[I], 1); //Add value 1 to new dictionary cell
        Message('Customer Name contains character s %1 times.', Counter.Get('s'));
    end;

    procedure DisplayCustomerName()
    var
        Customer: Record Customer;
        CustomerNo: Code[20];
        CustDictionary: Dictionary of [Code[20], Text[100]];
    begin
        if Customer.FindSet() then
            repeat
                CustDictionary.Add(Customer."No.", Customer.Name);
            until Customer.Next() = 0;

        foreach CustomerNo in CustDictionary.Keys() do
            if CustomerNo = '30000' then
                Message('Customer Name = %1', CustDictionary.Get('30000')); //School of Fine Art
    end;
}
