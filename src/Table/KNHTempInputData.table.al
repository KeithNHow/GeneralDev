namespace KNHGenDev;

table 50605 "KNH Temp Input Data"
{
    DataClassification = ToBeClassified;
    AllowInCustomizations = AsReadWrite;
    Caption = 'KNH Temp Input Data';

    fields
    {
        field(1; MyField; Integer)
        {
            Caption = 'My Field';
        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}