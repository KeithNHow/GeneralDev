/// <summary>
/// Table KNH Note (ID 50600).
/// </summary>

namespace KNHGenDev;

table 50600 "KNH Note"
{
    Caption = 'Notes';
    DataClassification = ToBeClassified;
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(1; "Link ID"; Integer)
        {
            Caption = 'Link ID';
            ToolTip = 'Primary Key';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            ToolTip = 'Description';
        }
        field(4; Note; Text[250])
        {
            Caption = 'Note';
            ToolTip = 'Note';
        }
        field(5; Created; DateTime)
        {
            Caption = 'Created';
            ToolTip = 'Created';
        }
        field(6; "User ID"; Text[132])
        {
            Caption = 'User ID';
            ToolTip = 'User ID';
        }
        field(7; "To User ID"; Text[132])
        {
            Caption = 'To User ID';
            ToolTip = 'To User ID';
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
