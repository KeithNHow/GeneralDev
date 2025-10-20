namespace GeneralDev.GeneralDev;

using Microsoft.Finance.Dimension;

page 50609 "KNH Dimension Set Tree Node"
{
    ApplicationArea = All;
    Caption = 'Dimension Set Tree Node';
    PageType = List;
    SourceTable = "Dimension Set Tree Node";
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
                field("Dimension Value ID"; Rec."Dimension Value ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Value ID field.', Comment = '%';
                }
                field("In Use"; Rec."In Use")
                {
                    ToolTip = 'Specifies the value of the In Use field.', Comment = '%';
                }
                field("Parent Dimension Set ID"; Rec."Parent Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Parent Dimension Set ID field.', Comment = '%';
                }
            }
        }
    }
}
