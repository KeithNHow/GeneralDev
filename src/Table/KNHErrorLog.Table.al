/// <summary>
/// Table KNH ErrorLog (ID 50603).
/// </summary>

namespace KNHGenDev;
using Microsoft.Utilities;
table 50603 "KNH Error Log"
{
    Caption = 'KNHErrorLog';
    DataClassification = CustomerContent;
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            ToolTip = 'Primary Key';
        }
        field(2; "Table No."; Integer)
        {
            Caption = 'Table No.';
            ToolTip = 'Table No.';
        }
        field(3; "Record No."; Code[20])
        {
            Caption = 'Record No.';
            ToolTip = 'Record No.';
        }
        field(4; "Error Code"; Code[20])
        {
            Caption = 'Error Code';
            ToolTip = 'Error Code';
        }
        field(5; "Error Text"; Code[100])
        {
            Caption = 'Error Text';
            ToolTip = 'Error Text';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
    end;

    /// <summary>
    /// GetLastEntryNo.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;
}
