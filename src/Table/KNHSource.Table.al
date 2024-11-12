/// <summary>
/// Table KNH Source (ID 50602).
/// </summary>
table 50602 "KNH Source"
{
    Caption = 'KNH Source';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Name)
        {
        }
    }

    trigger OnRename()
    var
        KNHSourceLine: Record "KNH Source Line";
    begin
        KNHSourceLine.SetRange("Source Code", xRec.Code);
        if KNHSourceLine.FindSet(true) then
            repeat
                KNHSourceLine.Rename(KNHSourceLine.Code, Rec.Code);
            until KNHSourceLine.Next() = 0;
    end;
}
