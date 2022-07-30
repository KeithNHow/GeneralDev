/// <summary>
/// Page Demo Order Proc. Extends Order Processor Role Center 9006
/// </summary>
pageextension 50001 "KNH Order Processing" extends "Order Processor Role Center"
{
    actions
    {
        addAfter("History")
        {
            action("Load")
            {
                ApplicationArea = All;
                Caption = 'Load';
                RunObject = codeunit "KNH Overloads";
            }
        }
        addafter("Load")
        {
            action("Sample Code")
            {
                ApplicationArea = All;
                Caption = 'Sample Code';
                RunObject = codeunit "KNH Sample Code";
            }
        }
        addafter("Sample Code")
        {
            action("Dictionary")
            {
                ApplicationArea = All;
                Caption = 'Dictionary';
                RunObject = codeunit "KNH Test Dictionary";
            }
        }
        addafter("Dictionary")
        {
            action("SystemFunctions")
            {
                ApplicationArea = All;
                Caption = 'System Functions';
                RunObject = codeunit "KNH System Functions";
            }
        }
    }
}