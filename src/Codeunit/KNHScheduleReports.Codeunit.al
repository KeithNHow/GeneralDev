namespace KNHGenDev;
using System.Threading;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Inventory.Requisition;
using Microsoft.Sales.Customer;

codeunit 50625 "KNH Schedule Reports"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        Customer: Record Customer;
        CalculatePlanReqWksh: Report "Calculate Plan - Req. Wksh.";
        CreateCustomerJournalLines: Report "Create Customer Journal Lines";
        ParameterStringMsg: Label 'Please Define the parameter string';
        DocumentTypes: Option;
    begin
        if Rec."Parameter String" = '' then
            Error(ParameterStringMsg);

        case Rec."Job Queue Category Code" of
            'CALCPLANWK': //Calculate plan
                begin
                    this.DecryptJobQueueParameters(Rec."Parameter String");
                    CalculatePlanReqWksh.InitializeRequest(this.StartDate, this.EndDate);
                    CalculatePlanReqWksh.SetTemplAndWorksheet(this.TemplateName, this.batchName);
                    CalculatePlanReqWksh.Run();
                end;
            'GENJOURNAL': //Create sales journal lines
                begin
                    this.DecryptJQParamsForCreateCustJnlLines(Rec."Parameter String");
                    Customer.SetRange(Blocked, Customer.Blocked::" "); //Filter customers
                    CreateCustomerJournalLines.SetTableView(Customer); //Copies view from Customer table
                    CreateCustomerJournalLines.InitializeRequest(DocumentTypes, WorkDate(), WorkDate());
                    CreateCustomerJournalLines.InitializeRequestTemplate(this.TemplateName, this.batchName, '');
                    CreateCustomerJournalLines.UseRequestPage(false); //Ignore request page
                    CreateCustomerJournalLines.SetDefaultDocumentNo(this.CurrentDocNo);
                    Commit(); //Commit is required to create lines
                    CreateCustomerJournalLines.Run();
                end;
        end;
    end;

    var
        batchName: Code[10];
        TemplateName: Code[10];
        CurrentDocNo: Code[20];
        EndDate: Date;
        StartDate: Date;

    local procedure DecryptJobQueueParameters(ParameterString: Text[250])
    var
        Pos: Integer;
    begin
        Pos := StrPos(ParameterString, ';'); //find pos of first separater
        Evaluate(this.TemplateName, CopyStr(ParameterString, 1, Pos - 1)); //copy first arg to var 

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1)); //copy all of param string after first separater to param string   
        Pos := StrPos(ParameterString, ';'); //find pos of first +
        Evaluate(this.batchName, CopyStr(ParameterString, 1, Pos - 1)); //copy first arg to var

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1));
        Pos := StrPos(ParameterString, ';');
        Evaluate(this.StartDate, CopyStr(ParameterString, 1, Pos - 1));

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1));
        Pos := StrPos(ParameterString, ';');
        Evaluate(this.EndDate, CopyStr(ParameterString, 1, Pos - 1));
    end;

    //Update variables for Create Customer Journal Lines
    local procedure DecryptJQParamsForCreateCustJnlLines(ParameterString: Text[250])
    var
        Pos: Integer;
    begin
        Clear(this.TemplateName);
        Clear(this.batchName);
        Clear(this.CurrentDocNo);

        Pos := StrPos(ParameterString, ';'); //find pos of first separater
        Evaluate(this.TemplateName, CopyStr(ParameterString, 1, Pos - 1)); //copy first arg to var 

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1)); //copy all of param string after first separater to param string   
        Pos := StrPos(ParameterString, ';'); //find pos of first +
        Evaluate(this.batchName, CopyStr(ParameterString, 1, Pos - 1)); //copy first arg to var

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1));
        Pos := StrPos(ParameterString, ';');
        Evaluate(this.CurrentDocNo, CopyStr(ParameterString, 1, Pos - 1));
    end;
}