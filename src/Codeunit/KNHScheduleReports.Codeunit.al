namespace KNHTest;
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
                    DecryptJobQueueParameters(Rec."Parameter String");
                    CalculatePlanReqWksh.InitializeRequest(StartDate, EndDate);
                    CalculatePlanReqWksh.SetTemplAndWorksheet(TemplateName, BatchName);
                    CalculatePlanReqWksh.Run();
                end;
            'GENJOURNAL': //Create sales journal lines
                begin
                    DecryptJQParamsForCreateCustJnlLines(Rec."Parameter String");
                    Customer.SetRange(Blocked, Customer.Blocked::" ");
                    CreateCustomerJournalLines.SetTableView(Customer);
                    CreateCustomerJournalLines.InitializeRequest(DocumentTypes, WorkDate(), WorkDate());
                    CreateCustomerJournalLines.InitializeRequestTemplate(TemplateName, BatchName, '');
                    CreateCustomerJournalLines.UseRequestPage(false);
                    CreateCustomerJournalLines.SetDefaultDocumentNo(CurrentDocNo);
                    Commit(); //Commit is required for create lines
                    CreateCustomerJournalLines.Run();
                end;
        end;
    end;

    var
        BatchName, TemplateName : Code[10];
        CurrentDocNo: Code[20];
        EndDate, StartDate : Date;

    local procedure DecryptJobQueueParameters(ParameterString: Text[250])
    var
        Pos: Integer;
    begin
        Pos := StrPos(ParameterString, ';'); //find pos of first separater
        Evaluate(TemplateName, CopyStr(ParameterString, 1, Pos - 1)); //copy first arg to var 

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1)); //copy all of param string after first separater to param string   
        Pos := StrPos(ParameterString, ';'); //find pos of first +
        Evaluate(BatchName, CopyStr(ParameterString, 1, Pos - 1)); //copy first arg to var

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1));
        Pos := StrPos(ParameterString, ';');
        Evaluate(StartDate, CopyStr(ParameterString, 1, Pos - 1));

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1));
        Pos := StrPos(ParameterString, ';');
        Evaluate(EndDate, CopyStr(ParameterString, 1, Pos - 1));
    end;

    local procedure DecryptJQParamsForCreateCustJnlLines(ParameterString: Text[250])
    var
        Pos: Integer;
    begin
        Clear(TemplateName);
        Clear(BatchName);
        Clear(CurrentDocNo);

        Pos := StrPos(ParameterString, ';'); //find pos of first separater
        Evaluate(TemplateName, CopyStr(ParameterString, 1, Pos - 1)); //copy first arg to var 

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1)); //copy all of param string after first separater to param string   
        Pos := StrPos(ParameterString, ';'); //find pos of first +
        Evaluate(BatchName, CopyStr(ParameterString, 1, Pos - 1)); //copy first arg to var

        Evaluate(ParameterString, CopyStr(ParameterString, Pos + 1));
        Pos := StrPos(ParameterString, ';');
        Evaluate(CurrentDocNo, CopyStr(ParameterString, 1, Pos - 1));
    end;
}