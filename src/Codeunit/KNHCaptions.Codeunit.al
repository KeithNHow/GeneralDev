codeunit 50650 "KNH Captions"
{
    trigger OnRun()
    var
        Cust: Record "Customer";
        MyCustTable: Text;
        MyCust: Text;
        MyMsg: Label 'My Customer %1 was found in %2', Comment = '%1 = My Customer, %2 = My Customer Table';
    begin
        Cust.SetRange("No.", '20000');
        if Cust.Find() then begin
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