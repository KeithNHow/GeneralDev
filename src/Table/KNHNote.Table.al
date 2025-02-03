/// <summary>
/// Table KNH Note (ID 50600).
/// </summary>

namespace KNHGenDev;

table 50600 "KNH Note"
{
    Caption = 'Notes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Link ID"; Integer)
        {
            Caption = 'Link ID';
            ToolTip = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            ToolTip = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; Note; Text[250])
        {
            Caption = 'Note';
            ToolTip = 'Note';
            DataClassification = CustomerContent;
        }
        field(5; Created; DateTime)
        {
            Caption = 'Created';
            ToolTip = 'Created';
            DataClassification = CustomerContent;
        }
        field(6; "User ID"; Text[132])
        {
            Caption = 'User ID';
            ToolTip = 'User ID';
            DataClassification = CustomerContent;
        }
        field(7; "To User ID"; Text[132])
        {
            Caption = 'To User ID';
            ToolTip = 'To User ID';
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
