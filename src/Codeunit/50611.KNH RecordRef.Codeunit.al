/// <summary>
/// Codeunit KNH RecordRef (ID 50611).
/// RecordRef - References a record in a table.
/// RecordID - Contains the table number and the primary key of a table.
/// </summary>
codeunit 50611 "KNH RecordRef"
{
    trigger OnRun()
    begin
        EmailRecordRef();
        //RecordLinkExport();
    end;

    local procedure MyRecordRef()
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

    local procedure EmailRecordRef()
    var
        EmailRecordRef: RecordRef;
        MyFieldRef: FieldRef;
        varFilters: Text;
        Counter: Integer;
        FoundMsg: Label 'The filter is set on the %1 field.';
    begin
        EmailRecordRef.Open(Database::"Sent Email"); //Open table
        //MyFieldRef := EmailRecordRef.Field(1); //Assign first field in table
        //MyFieldRef.Value := ''; //Assign Value to field
        EmailRecordRef.SetRecFilter();
        if EmailRecordRef.FindSet() then begin
            repeat
                Counter += 1;
            until EmailRecordRef.Next() = 0;
        end;
        Message(Format(Counter));
    end;

    local procedure CustRecordRef()
    var
        CustRecordRef: RecordRef;
        MyFieldRef: FieldRef;
        //CustRecordId: RecordId;
        varFilters: Text;
        FoundMsg: Label 'The filter is set on the %1 field.';
    begin
        CustRecordRef.Open(Database::Customer); //Open table
        //MyFieldRef := EmailRecordRef.Field(1); //Assign first field in table
        //MyFieldRef.Value := ''; //Assign Value to field
        CustRecordRef.SetRecFilter();
        varFilters := CustRecordRef.GetFilters;
        Message(FoundMsg, varFilters);
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
        KNHNote: Record "KNH Note";
        OppRecordRef: RecordRef;
        MyInStream: InStream;
        LongText: Text;
    begin
        Opportunity.FindSet(); //Find records
        repeat
            OppRecordRef.GetTable(Opportunity); //open table
            RecordLink.SetCurrentKey("Record ID"); //Set key
            RecordLink.SetRange("Record ID", OppRecordRef.RecordId); //Filter records
            RecordLink.SetRange(Company, CompanyName);
            Recordlink.SetAutoCalcFields(Note);
            if RecordLink.FindSet() then begin //Check if table has records
                repeat
                    KNHNote.Init();
                    KNHNote."Link ID" := RecordLink."Link ID";
                    KNHNote.Description := RecordLink.Description;
                    RecordLink.Note.CreateInStream(MyInStream);
                    MyInstream.Read(LongText);
                    KNHNote.Note := CopyStr(Format(LongText), 1, 50);
                    KNHNote.Created := RecordLink.Created;
                    KNHNote."User ID" := RecordLink."User ID";
                    KNHNote."To User ID" := RecordLink."To User ID";
                    KNHNote.Insert();
                until RecordLink.Next() = 0
                //RecordLink.Delete();
            end;
        until Opportunity.Next() = 0; //Next Record
    end;
}
