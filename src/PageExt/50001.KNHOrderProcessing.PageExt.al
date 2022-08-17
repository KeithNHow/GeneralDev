/// <summary>
/// Page Demo Order Proc. Extends Order Processor Role Center 9006
/// </summary>
pageextension 50001 "KNH_Order_Processing" extends "Order Processor Role Center"
{
    actions
    {
        addAfter("History")
        {
            action("Load")
            {
                ApplicationArea = All;
                ToolTip = 'Load';
                Caption = 'Load';
                RunObject = codeunit "KNH Overloads";
            }
        }
        addafter("Load")
        {
            action("Sample Code")
            {
                ApplicationArea = All;
                ToolTip = 'Sample Code';
                Caption = 'Sample Code';
                RunObject = codeunit "KNH Loop Variations";
            }
        }
        addafter("Sample Code")
        {
            action("Dictionary")
            {
                ApplicationArea = All;
                ToolTip = 'Dictionary';
                Caption = 'Dictionary';
                RunObject = codeunit "KNH Dictionary";
            }
        }
        addafter("Dictionary")
        {
            action("SystemFunctions")
            {
                ApplicationArea = All;
                ToolTip = 'System Functions';
                Caption = 'System Functions';
                RunObject = codeunit "KNH System Functions";
            }
        }
    }
}