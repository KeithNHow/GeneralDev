//Marking a record id used to find records and then refer to them at some later time in program execution. 

namespace KNHGenDev;
using Microsoft.Sales.Customer;

codeunit 50623 "KNH Marked Customers"
{
    trigger OnRun()
    var
        Customer: Record Customer;
        Counter1: Integer;
        Counter2: Integer;
        Count1Msg: Label 'Number of records in Customer table: %1\', Comment = '%1 = Count';
        Count2Msg: Label 'Number of records MarkedOnly: %2', Comment = '%2 = Count';
    begin
        Counter1 := Customer.Count();
        Customer.SetCurrentKey(Customer."No.");
        if Customer.FindSet() then
            repeat
                if Customer."No." in ['10000', '30060'] then begin
                    Customer.Mark(true);
                    Counter1 += 1;
                end;
            until Customer.Next() = 0;
        Customer.MarkedOnly(true);
        if Customer.FindSet() then
            repeat
                Counter2 += 1;
            until Customer.Next() = 0;
        Message(Count1Msg + Count2Msg, Counter1, Counter2);
    end;
}