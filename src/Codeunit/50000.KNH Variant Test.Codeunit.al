/// <summary>
/// Codeunit KNH Variant Test (ID 50000).
/// </summary>
codeunit 50000 "KNH Variant Test"
{
    TableNo = 27; //Item

    trigger OnRun()
    begin
        Message(Format(Rec));
    end;

    /// <summary>
    /// Test.
    /// </summary>
    procedure Test()
    var
        Cust: Record Customer;
        Vend: Record Vendor;
        Item: Record Item;
        MyDate: Date;
    begin
        MyDate := Today();
        Cust.FindFirst();
        Vend.FindLast();
        Item.FindFirst();
        LogInformation(Cust);
        LogInformation(Vend);
        LogInformation(Item);
    end;

    local procedure LogInformation(V1: Variant)
    var
        Ref: RecordRef;
        Cust: Record Customer;
        CodeunitNo: Integer;
    begin
        if not V1.IsRecord then
            Error('You cannot pass a non-record variable to LogInformation');
        Ref.GetTable(V1);

        V1 := Ref;
        if Ref.Number = 18 then
            Cust := V1;
        Page.RunModal(0, V1);

        CodeunitNo := 50003;
        Codeunit.Run(CodeunitNo, V1); //Allows the running of a codeunit with specified table
    end;
}