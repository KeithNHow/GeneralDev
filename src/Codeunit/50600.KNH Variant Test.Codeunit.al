/// <summary>
/// Codeunit KNH Variant Test (ID 50600).
/// The AL variant data type can contain many AL data types.
/// </summary>
codeunit 50600 "KNH Variant Test"
{
    trigger OnRun()
    begin
        Test();
    end;

    var
        Customer: Record Customer;
        CustRecId: RecordId;

    /// <summary>
    /// Test.
    /// </summary>
    procedure Test()
    begin
        Customer.FindFirst();
        CustRecId := Customer.RecordId;
        ShowCustList(Customer, CustRecId);
    end;

    local procedure ShowCustList(pCustVariant: Variant; pCustVariantId: Variant) //Receive Cust as record variant
    var
        CustRecordRef: RecordRef;
        VariantTxt: Label 'Variant contains Record Id %1.', Comment = '%1 = CustVariantId';
        RecordRefTxt: Label 'Record Reference is %1 and not 18.', Comment = '%1 = CustRecordRef';
        ErrorTxt: Label 'You cannot pass a non-record variable to a record variant.';
    begin
        if not pCustVariant.IsRecord then //Check record variant exists
            Error(ErrorTxt);
        CustRecordRef.GetTable(pCustVariant); //Gets Customer table based on the record variant

        if CustRecordRef.Number = 18 then
            Page.RunModal(0, pCustVariant)
        else
            Message(RecordRefTxt, CustRecordRef.Number);

        if pCustVariantId.IsRecordId then
            Message(VariantTxt, pCustVariantId); //01122121
    end;
}