page 50604 "KNH Error Log"
{
    ApplicationArea = All;
    Caption = 'KNH Error Log';
    PageType = List;
    SourceTable = "KNH Error Log";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Caption = 'Entry No.';
                    ToolTip = 'Entry No.';
                }
                field("Table No."; Rec."Table No.")
                {
                    ApplicationArea = All;
                    Caption = 'Table No.';
                    ToolTip = 'Table No.';
                }
                field("Record No."; Rec."Record No.")
                {
                    ApplicationArea = All;
                    Caption = 'Record No.';
                    ToolTip = 'Record No.';
                }
                field("Error Code"; Rec."Error Code")
                {
                    ApplicationArea = All;
                    Caption = 'Error Code';
                    ToolTip = 'Error Code';
                }
                field("Error Text"; Rec."Error Text")
                {
                    ApplicationArea = All;
                    Caption = 'Error Text';
                    ToolTip = 'Error Text';
                }
            }
        }
    }
}
