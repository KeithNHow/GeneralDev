/// <summary>
/// Table "KNH Source Lines" (ID 50601).
/// </summary>

namespace KNHGenDev;

table 50601 "KNH Source Line"
{
    Caption = 'Source Lines';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Source Code"; Code[20])
        {
            Caption = 'Source Code';
            ToolTip = 'Source Code';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Code, "Source Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, Description)
        {
        }
    }
}
