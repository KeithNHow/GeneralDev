namespace GeneralDev.GeneralDev;

using Microsoft.Finance.Dimension;

page 50610 "KNH Dimension Set Entries"
{
    ApplicationArea = All;
    Caption = 'Dimension Set Entries';
    PageType = List;
    SourceTable = "Dimension Set Entry";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field.', Comment = '%';
                }
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ToolTip = 'Specifies the value of the Dimension Code field.', Comment = '%';
                }
                field("Dimension Value Code"; Rec."Dimension Value Code")
                {
                    ToolTip = 'Specifies the value of the Dimension 1 Value Code field.', Comment = '%';
                }
                field("Dimension Value ID"; Rec."Dimension Value ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Value ID field.', Comment = '%';
                }
                field("Dimension Name"; Rec."Dimension Name")
                {
                    ToolTip = 'Specifies the value of the Dimension Name field.', Comment = '%';
                }
                field("Dimension Value Name"; Rec."Dimension Value Name")
                {
                    ToolTip = 'Specifies the value of the Dimension Value Name field.', Comment = '%';
                }
                field("Global Dimension No."; Rec."Global Dimension No.")
                {
                    ToolTip = 'Specifies whether the dimension is a global dimension.', Comment = '%';
                }
            }
        }
    }
}
