///<summary>
/// Library for Workflow Events
///</summary>
namespace KNHGenDev;
using Microsoft.Purchases.Document;

codeunit 50661 "KNH Workflow Event Library"
{
    //Publication of workflow event
    [IntegrationEvent(false, false)]
    procedure OnAfterPostPurchaseHeader(PurchaseHeader: Record "Purchase Header")
    begin
    end;
}