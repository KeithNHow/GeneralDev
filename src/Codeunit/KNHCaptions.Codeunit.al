///<Summary>
///Codeunit finds a specific Customer record. It then runs a function to check whether the 'No.' field contains a value and whether the value is '20000'. It then enters the field caption into a variable and the field name into another variable, before displaying a message containing the variable values. 
///</Summary>
namespace KNHGenDev;
using Microsoft.sales.Customer;

codeunit 50650 "KNH Captions"
{
    trigger OnRun()
    var
        Cust: Record "Customer";
        MyCustTable: Text;
        MyCust: Text;
        MyMsg: Label 'My Customer %1 was found in %2', Comment = '%1 = My Customer, %2 = My Customer Table';
    begin
        if Cust.Find('20000') then begin
            this.TestMyField(Cust);
            MyCustTable := Cust.TableCaption();
            MyCust := Cust.FieldCaption(Name);
            Message(MyMsg, MyCust, MyCustTable);
        end;
    end;

    procedure TestMyField(var pCust: Record "Customer")
    begin
        pCust.TestField("No."); //Check field contains a value
        pCust.TestField("No.", '20000') //Check field contains specific value
    end;
}