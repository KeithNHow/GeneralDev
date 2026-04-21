namespace KNHGenDev;
using Microsoft.Purchases.Vendor;

pageextension 50621 "KNH VendorCard" extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field(IntegerField; Rec.IntegerField)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies integer to be displayed on Vendor Card.';
            }
        }
    }

    actions
    {
        addlast("Ven&dor")
        {
            action(GetMessage)
            {
                Caption = 'Get Single Instance';
                ToolTip = 'Get Single Instance Message';
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = Basic, Suite;
                Image = UpdateUnitCost;

                trigger OnAction()
                begin
                    TheText := KNHSetSingleInstance.GetSingleInstance();
                    Message(TheText);
                end;
            }
        }
    }

    var
        KNHSetSingleInstance: Codeunit "KNH Set Single Instance";
        TheText: Text[100];
}