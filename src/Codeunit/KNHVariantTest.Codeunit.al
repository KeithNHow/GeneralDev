/// <summary>
/// Codeunit KNH Variant Test (ID 50000).
/// </summary>
codeunit 50000 "KNH_Variant_Test"
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
        Customer: Record Customer;
        Vendor: Record Vendor;
        Item: Record Item;
    begin
        Customer.FindFirst();
        Vendor.FindLast();
        Item.FindFirst();
        LogInformation(Customer);
        LogInformation(Vendor);
        LogInformation(Item);
    end;

    local procedure LogInformation(LogVariant: Variant)
    var
        Customer: Record Customer;
        RecordRef: RecordRef;
        CodeunitNo: Integer;
    begin
        if not LogVariant.IsRecord then
            Error('You cannot pass a non-record variable to LogInformation');
        RecordRef.GetTable(LogVariant);

        LogVariant := RecordRef;
        if RecordRef.Number = 18 then
            Customer := LogVariant;
        Page.RunModal(0, LogVariant);

        CodeunitNo := 50003;
        Codeunit.Run(CodeunitNo, LogVariant); //Allows the running of a codeunit with specified table
    end;
}