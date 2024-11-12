/// <summary>
/// Codeunit KNH_RecordRef (ID 50611).
/// RecordRef - REFERENCES A RECORD IN A TABLE.
/// RecordID - Contains the table number and the primary key of a table.
/// </summary>
codeunit 50611 "KNH RecordRef"
{
    trigger OnRun()
    begin
        EmailRecordRef();
        //RecordLinkExport();
    end;

    /// <summary>
    /// MyRecordRef.
    /// </summary>
    procedure MyRecordRef()
    var
        CustRecId: RecordId;
        CustRecordRef: RecordRef;
        MyFieldRef: FieldRef;
    begin
        CustRecordRef.Open(Database::Customer); //Open table
        MyFieldRef := CustRecordRef.Field(1); //Assign first field in table
        MyFieldRef.Value := '50000'; //Assign Value to field
        if CustRecordRef.Find('=') then begin //Find record
            CustRecId := CustRecordRef.RecordId; //Convert RecRef to RecId
            CustRecordRef.Get(CustRecId);
            Message(Format(CustRecordRef)); //Display record content
        end;
    end;

    local procedure EmailRecordRef()
    var
        ERecordRef: RecordRef;
        Counter: Integer;
    begin
        ERecordRef.Open(Database::"Sent Email"); //Open table
        ERecordRef.SetRecFilter();
        if ERecordRef.FindSet() then
            repeat
                Counter += 1;
            until ERecordRef.Next() = 0;
        Message(Format(Counter));
    end;

    /// <summary>
    /// CustRecordReference
    /// </summary>
    procedure CustRecordReference()
    var
        CRecordRef: RecordRef;
        FoundMsg: Label 'The filter is set on the %1 field.', Comment = '%1 = varFilters';
        //CustRecordId: RecordId;
        varFilters: Text;
    begin
        CRecordRef.Open(Database::Customer); //Open table
        //MyFieldRef := EmailRecordRef.Field(1); //Assign first field in table
        //MyFieldRef.Value := ''; //Assign Value to field
        CRecordRef.SetRecFilter();
        varFilters := CRecordRef.GetFilters;
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

    /// <summary>
    /// RecordLinkExport.
    /// </summary>
    procedure RecordLinkExport()
    var
        KNHNote: Record "KNH Note";
        Opportunity: Record Opportunity;
        RecordLink: Record "Record Link";
        OpportunityRecordRef: RecordRef;
        MyInStream: InStream;
        LongText: Text;
    begin
        Opportunity.FindSet(); //Find records
        repeat
            //Gets the table of a Record variable and causes the RecordRef to refer to the same table.
            OpportunityRecordRef.GetTable(Opportunity); //Open table using Rec Ref
            RecordLink.SetCurrentKey("Record ID"); //Set key
            RecordLink.SetRange("Record ID", OpportunityRecordRef.RecordId); //Filter RecLink by Opp RecordId
            RecordLink.SetRange(Company, CompanyName);
            RecordLink.SetAutoCalcFields(Note);
            if RecordLink.FindSet() then //Check if table has records
                repeat
                    KNHNote.Init();
                    KNHNote."Link ID" := RecordLink."Link ID";
                    KNHNote.Description := RecordLink.Description;
                    RecordLink.Note.CreateInStream(MyInStream);
                    MyInStream.Read(LongText);
                    KNHNote.Note := CopyStr(Format(LongText), 1, 50);
                    KNHNote.Created := RecordLink.Created;
                    KNHNote."User ID" := RecordLink."User ID";
                    KNHNote."To User ID" := RecordLink."To User ID";
                    KNHNote.Insert();
                until RecordLink.Next() = 0
        //RecordLink.Delete();
        until Opportunity.Next() = 0; //Next Record
    end;

    procedure RecordRefTest()
    var
        TempCustomer: Record Customer temporary;
        TempRecordRef: RecordRef;
        i: Integer;
    begin
        TempRecordRef.Open(Database::Customer, true);
        for i := 1 to 10 do begin
            TempRecordRef.Init();
            TempRecordRef.Field(1).Value := 'Test0' + Format(i); //1 = No.
            TempRecordRef.Field(2).Value := 'Test ' + Format(i); //2 = Name
            TempRecordRef.Insert(true);
        end;
        //Sets the table of a Record variable and causes the RecordRef to refer to the same table.
        TempRecordRef.SetTable(TempCustomer); //Places 10 records in temporary Customer table
        Message(Format(TempCustomer.Count));
    end;

    //RecordRef example
    procedure OpenRecRef()
    var
        RecordRef: RecordRef;
    begin
        RecordRef.Open(Database::Customer);
    end;

    //RecordRef field value example
    procedure OpenRecRefField()
    var
        RecordRef: RecordRef;
    begin
        RecordRef.Open(Database::Customer);
        RecordRef.FindFirst();
        Message(Format(RecordRef.Field(1))); //10000
    end;

    //RecordRef field caption example
    procedure OpenRecRefCaption()
    var
        RecordRef: RecordRef;
    begin
        RecordRef.Open(Database::Customer);
        RecordRef.FindFirst();
        Message(RecordRef.Field(1).Caption); //"No."
    end;

    //RecordRef field index example
    procedure OpenRecRefIndex()
    var
        RecordRef: RecordRef;
    begin
        RecordRef.Open(Database::Customer);
        RecordRef.FindFirst();
        Message(RecordRef.FieldIndex(26).Caption); //Fin. Charge Terms Code
        Message(RecordRef.Field(28).Caption); //Fin. Charge Terms Code
    end;

    //RecordRef KeyIndex example
    procedure OpenRecRefKeyIndex()
    var
        RecordRef: RecordRef;
    begin
        RecordRef.Open(Database::Customer);
        RecordRef.FindFirst();
        Message(Format(RecordRef.KeyIndex(2))); //Field3 = Search Name
    end;

    //FieldRef - Provides a way to interact with the fields of a table
    //FieldRef example
    procedure OpenRecField()
    var
        RecordRef: RecordRef;
        FieldRef: FieldRef;
    begin
        RecordRef.Open(Database::Customer);
        RecordRef.FindFirst();
        FieldRef := RecordRef.Field(1);
        Message(FieldRef.Caption); //"No."
        Message(RecordRef.Field(1).Caption);
    end;

    //RecordRef - Used to work with a record object when you don't know which record your handling.
    //Check if a given payment method exists in a related table before deleting it.
    //Payment Method = table 289
    //Payment Method Code tables = 18,21,23,25,36,38,81,110,112,114,120,122,124
    procedure PreventDataDeletionIfUsed(Recordref: RecordRef)
    var
        Field: Record Field;
        RecordRef2: RecordRef;
        DataUsedLbl: Label 'The value %1 exists in the field %2 of %3 table. Deletion is not allowed.', Comment = '%1 = KeyIndex1, %2 = FieldCaption, %3 = TableCaption)';
    begin
        //Gets a record based on values stored in primary key fields.
        Field.Get(Recordref.Number, Recordref.KeyIndex(1).FieldIndex(1).Number);
        Field.SetRange(Type, Field.Type);
        Field.SetRange(RelationTableNo, Recordref.Number);
        Field.SetRange(ObsoleteState, Field.ObsoleteState::No);
        if Field.FindSet() then
            repeat
                RecordRef2.Open(Field.TableNo);
                RecordRef2.Field(Field."No.").SetRange(Recordref.KeyIndex(1).FieldIndex(1).Value);
                if not RecordRef2.IsEmpty then
                    //KeyIndex1 = TableNo, "No." //FieldIndex1 = TableNo
                    Error(DataUsedLbl, Recordref.KeyIndex(1).FieldIndex(1).Value, Field."Field Caption", RecordRef2.Caption);
                RecordRef2.Close();
            until Field.Next() = 0;
    end;
}
