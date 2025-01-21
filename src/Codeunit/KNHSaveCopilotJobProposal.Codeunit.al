codeunit 50645 "KNH Save Copilot Job Proposal"
{
    trigger OnRun()
    begin

    end;

    procedure Save(var CustomerNo: Code[20]; var CopilotJobProposal: Text)
    begin
        CustomerNo := CustomerNo;
        CopilotJobProposal := CopilotJobProposal;
    end;
}