/// <summary>
/// Table KNH Note (ID 50600).
/// </summary>
table 50600 "KNH Note"
{
    Caption = 'KNH Notes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Link ID"; Integer)
        {
            Caption = 'Link ID';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; Note; Text[250])
        {
            Caption = 'Note';
            DataClassification = CustomerContent;
        }
        field(5; Created; DateTime)
        {
            Caption = 'Created';
            DataClassification = CustomerContent;
        }
        field(6; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(7; "To User ID"; Text[132])
        {
            Caption = 'To User ID';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Link ID")
        {
            Clustered = true;
        }
    }
}
