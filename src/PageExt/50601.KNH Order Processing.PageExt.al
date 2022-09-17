/// <summary>
/// Page Demo Order Proc. Extends Order Processor Role Center 9006
/// </summary>
pageextension 50601 "KNH Order Processing" extends "Order Processor Role Center"
{
    actions
    {
        addAfter("History")
        {
            action(OverLoad) //604
            {
                ApplicationArea = All;
                ToolTip = 'OverLoad';
                Caption = 'OverLoad';
                RunObject = codeunit "KNH Overloads";
            }
        }
        addafter(OverLoad)
        {
            action("Copy Test") //601
            {
                ApplicationArea = All;
                ToolTip = 'Copy Test';
                Caption = 'Copy Test';
                RunObject = codeunit "KNH Loop Variations";
            }
        }
        addafter("Copy Test")
        {
            action(Dictionary) //607
            {
                ApplicationArea = All;
                ToolTip = 'Dictionary';
                Caption = 'Dictionary';
                RunObject = codeunit "KNH Dictionary";
            }
        }
        addafter(Dictionary)
        {
            action(SystemFunctions) //609
            {
                ApplicationArea = All;
                ToolTip = 'System Functions';
                Caption = 'System Functions';
                RunObject = codeunit "KNH System Functions";
            }
        }
        addafter(SystemFunctions)
        {
            action(TransferFields)
            {
                ApplicationArea = All;
                ToolTip = 'TransferFields';
                Caption = 'TransferFields';
                RunObject = codeunit "KNH TransferFields";
            }
        }
        addafter(TransferFields)
        {
            action(VariantTest)
            {
                ApplicationArea = All;
                ToolTip = 'Variant Test';
                Caption = 'Variant Test';
                RunObject = codeunit "KNH Variant Test";
            }
        }
        addafter(VariantTest)
        {
            action(RecordRef)
            {
                ApplicationArea = All;
                ToolTip = 'Record Link Export';
                Caption = 'Record Link';
                RunObject = codeunit "KNH RecordRef";
            }
        }
        addafter(RecordRef)
        {
            action(Notes)
            {
                ApplicationArea = All;
                ToolTip = 'Notes';
                Caption = 'Notes';
                RunObject = Page "KNH Notes";
            }
        }
    }
}