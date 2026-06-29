///<summary>
///Page extension to trigger new event code.
///</summary>
namespace KNHGenDev;
using Microsoft.Purchases.Document;


pageextension 50660 "KNH PurchOrder" extends "Purchase Order"
{
    layout
    {
        modify(Status)
        {
            trigger OnBeforeValidate();
            var
                PurchaseHeader: Record "Purchase Header";
                KNHWorkflowEventLibrary: Codeunit "KNH Workflow Event Library";
            begin
                KNHWorkflowEventLibrary.OnAfterPostPurchaseHeader(PurchaseHeader);
            end;
        }
    }
}