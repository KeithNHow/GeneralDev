/// <summary>
/// Codeunit KNH RecordRef (ID 50611).
/// RecordRef - References a record in a table.
/// RecordID - Contains the table number and the primary key of a table.
/// </summary>
codeunit 50611 "KNH RecordRef"
{
    trigger OnRun()
    begin
        RecordLinkExport();
    end;

    /// <summary>
    /// MyRecordRef.
    /// </summary>
    procedure MyRecordRef()
    var
        CustRecordRef: RecordRef;
        MyFieldRef: FieldRef;
        CustRecordId: RecordId;
    begin
        CustRecordRef.Open(Database::Customer); //Open table
        MyFieldRef := CustRecordRef.Field(1); //Assign first field in table
        MyFieldRef.Value := '50000'; //Assign Value to field
        if CustRecordRef.Find('=') then begin //Find record
            CustRecordId := CustRecordRef.RecordId; //Convert RecRef to RecId
            CustRecordRef.Get(CustRecordId);
            Message(Format(CustRecordRef)); //Display record content
        end;
    end;

    /// <summary>
    /// RecordLinkRecRef.
    /// </summary>
    procedure RecordLinkRecRef()
    var
        RecordLink: Record "Record Link";
    begin
        RecordLink.SetRange(Type, 1);
        if RecordLink.FindFirst() then
            Message('%1', RecordLink."Record ID")
        else
            Message('No records found in the table');
    end;

    local procedure RecordLinkExport()
    var
        Opportunity: Record Opportunity;
        RecordLink: Record "Record Link";
        OppRecordRef: RecordRef;
        Counter: Integer;
    begin
        Opportunity.FindSet();
        repeat
            OppRecordRef.GetTable(Opportunity);
            RecordLink.SetCurrentKey("Record ID");
            RecordLink.SetRange("Record ID", OppRecordRef.RecordId);
            if not RecordLink.IsEmpty then
                Counter += 1;
        until Opportunity.Next() = 0;
        Message(Format(Counter));
    end;
}
