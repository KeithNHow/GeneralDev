///<Summary>
///Codeunit to handle new Workflow events
///</Summary>
namespace KNHGenDev;
using Microsoft.Purchases.Document;
using System.Automation;

codeunit 50660 "KNH Workflow Events"
{
    //Method to declares the workflow event
    procedure KNHWorkflowEventCode(): code[128]
    var
    begin
        exit('KNHWorkflowEvent01');
    end;

    //Method to Subscribe to the AddEventToLibrary event in the Workflow Event Handling codeunit.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure AddKNHWorkflowEventsToLibrary()
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        //Func Name, TableID, Desc, RequestPageID, UsedForRecordChanege
        WorkflowEventHandling.AddEventToLibrary(this.KNHWorkflowEventCode(), Database::"Purchase Header", 'My first Purch Order Workflow Event', 0, false);
    end;

    //Method to Subscribe to the OnAfterPostPurchaseHeader event in the KNHWorkflowEventLibrary codeunit.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"KNH Workflow Event Library", 'OnAfterPostPurchaseHeader', '', true, true)]
    local procedure RunWorkflowOnAfterPostPurchaseHeader(PurchaseHeader: Record "Purchase Header")
    var
        WorkflowManagement: Codeunit "Workflow Management";
    begin
        WorkflowManagement.HandleEvent(this.KNHWorkflowEventCode(), PurchaseHeader);
    end;

    //Another task that can be performed at this point is to specify which filter fields appear in the Workflow Event Conditions page.

    //Method to subscribe to the OnAddWorkflowEventPredecessorsToLibrary event in the Workflow Event Handling codeunit.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure AddWorkflowEventHierarchiesToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            this.KNHWorkflowEventCode():
                //WorkflowEventHandling.AddEventPredecessor(KNHWorkflowEventCode(), WorkflowEventHandling./*[Add your predecessor event code]*/);
                ;
        end;
    end;

    //Method to subscribe to the OnAddWorkflowTableRelationsToLibrary event in the Workflow Event Handling codeunit.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowTableRelationsToLibrary', '', false, false)]
    local procedure AddWorkflowTableRelationsToLibrary()
    var
        WorkflowSetup: Codeunit "Workflow Setup";
    begin
        WorkflowSetup.InsertTableRelation(Database::"Purchase Header", 1, Database::"Approval Entry", 2);
    end;
}