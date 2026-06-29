///<summary>
///Codeunit to handle new Workflow responses
///</summary>
namespace KNHGenDev;
using Microsoft.Purchases.Document;
using System.Automation;

codeunit 50662 "KNH Workflow Responses"
{
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";

    //Method to identify the workflow response code
    procedure KNHWorkflowResponseCode(): code[128]
    begin
        exit('KNHWorkflowResponse01');
    end;

    //Method to Subscribe to the event to add a workflow response
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', true, true)]
    local procedure AddWorkflowResponsesToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(this.KNHWorkflowResponseCode(), Database::"Purchase Header", 'Send a notification.', 'GROUP 50100');
    end;

    //Method to handle the workflow response
    local procedure KNHWorkflowResponse(PurchaseHeader: Record "Purchase Header"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowStepArgument: Record "Workflow Step Argument";
    begin
        if WorkflowStepArgument.Get(WorkflowStepInstance.Argument) then;

        Message('Status change on: %1 %2.\%3', PurchaseHeader."Document Type", PurchaseHeader."No.", WorkflowStepArgument."My New Response Option")
    end;

    //Method to execute the workflow response
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', true, true)]
    local procedure ExecuteKNHWorkflowResponses(ResponseWorkflowStepInstance: Record "Workflow Step Instance"; var ResponseExecuted: Boolean; var Variant: Variant; xVariant: Variant)
    var
        WorkflowResponse: record "Workflow Response";
    begin
        if WorkflowResponse.Get(ResponseWorkflowStepInstance."Function Name") then
            case WorkflowResponse."Function Name" of
                this.KNHWorkflowResponseCode():
                    begin
                        this.KNHWorkflowResponse(Variant, ResponseWorkflowStepInstance);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Method used to add the workflow event/response combinations to 'WF Event/Response Combination' table.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure AddMyworkflowEventOnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        KNHWorkflowEvents: Codeunit "KNH Workflow Events";
    begin
        case ResponseFunctionName of
            this.KNHWorkflowResponseCode():
                this.WorkflowResponseHandling.AddResponsePredecessor(this.KNHWorkflowResponseCode(), KNHWorkflowEvents.KNHWorkflowEventCode());
        end;
    end;
}