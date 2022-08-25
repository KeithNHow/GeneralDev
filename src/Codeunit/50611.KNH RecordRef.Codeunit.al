/// <summary>
/// Codeunit KNH RecordRef (ID 50611).
/// </summary>
codeunit 50611 "KNH RecordRef"
{
    local procedure MyRecordRef()
    var
        CustRecRef: RecordRef;
        MyFieldRef: FieldRef;
        CustRecId: RecordId;
    begin
        CustRecRef.Open(Database::Customer); //Open table
        MyFieldRef := CustRecRef.Field(1); //Assign first field in table
        MyFieldRef.Value := '50000'; //Assign Value to field
        if CustRecRef.Find('=') then begin //Find record
            CustRecId := CustRecRef.RecordId; //Convert RecRef to RecId
            CustRecRef.Get(CustRecId);
            Message(Format(CustRecRef)); //Display record content
        end;
    end;
}
