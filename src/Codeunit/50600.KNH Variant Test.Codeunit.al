/// <summary>
/// Codeunit KNH Variant Test (ID 50600).
/// The AL variant data type can contain many AL data types.
/// </summary>
codeunit 50600 "KNH Variant Test"
{
    TableNo = 27; //Item

    trigger OnRun()
    begin
        Test();
    end;

    var
        Customer: Record Customer;
        Vendor: Record Vendor;
        CustRecId: RecordId;
        MessageTxt: Text;

    /// <summary>
    /// Test.
    /// </summary>
    procedure Test()
    begin
        Customer.FindFirst();
        CustRecId := Customer.RecordId;
        ShowCustList(Customer, CustRecId);
    end;

    local procedure ShowCustList(CustVariant: Variant; CustVariantId: Variant) //Receive Cust as record variant
    var
        CustRecordRef: RecordRef;
        CodeunitNo: Integer;
        VariantTxt: Label 'Variant contains Record Id %1.', Comment = '%1 = CustVariantId';
        RecordRefTxt: Label 'Record Reference is %1 and not 18.', Comment = '%1 = CustRecordRef';
        ErrorTxt: Label 'You cannot pass a non-record variable to a record variant.';
    begin
        if not CustVariant.IsRecord then //Check record variant exists
            Error(ErrorTxt);
        CustRecordRef.GetTable(CustVariant); //Gets Customer table based on the record variant

        if CustRecordRef.Number = 18 then
            Page.RunModal(0, CustVariant)
        else
            Message(RecordRefTxt, CustRecordRef.Number);

        if CustVariantId.IsRecordId then
            Message(VariantTxt, '%1');
    end;
}