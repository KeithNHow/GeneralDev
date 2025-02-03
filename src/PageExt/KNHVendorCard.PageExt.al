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
            action(UpdateIntField)
            {
                Caption = 'Update Integer Field';
                ToolTip = 'Update Integer Field';
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = Basic, Suite;
                Image = UpdateUnitCost;

                trigger OnAction()
                var
                    KNHSingleInstance: Codeunit "KNH Single Instance";
                begin
                    Rec.IntegerField := KNHSingleInstance.GetSingleInstance();
                end;
            }
        }
    }

    procedure UpdateIntegerField()
    var
        KNHSingleInstance: Codeunit "KNH Single Instance";
    begin
        Rec.IntegerField := KNHSingleInstance.GetSingleInstance();
    end;
}