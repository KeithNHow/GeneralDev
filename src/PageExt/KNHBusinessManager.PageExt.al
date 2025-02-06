//PageExt "KNH Business Manager" extends Business Manager Role Center 9022
namespace KNHGenDev;
using Microsoft.Finance.RoleCenters;

pageextension 50604 "KNH Business Manager" extends "Business Manager Role Center"
{
    actions
    {
        addafter(Reports)
        {
            action(KNH_OverLoad)
            {
                ApplicationArea = All;
                ToolTip = 'OverLoad';
                Caption = 'OverLoad';
                RunObject = codeunit "KNH Overloads";
            }
        }
        addafter(KNH_OverLoad)
        {
            action(KNH_LoopVariations)
            {
                ApplicationArea = All;
                ToolTip = 'Copy Test';
                Caption = 'Copy Test';
                RunObject = codeunit "KNH Loop Variations";
            }
        }
        addafter(KNH_LoopVariations)
        {
            action(KNH_Dictionary)
            {
                ApplicationArea = All;
                ToolTip = 'Dictionary';
                Caption = 'Dictionary';
                RunObject = codeunit "KNH Dictionary";
            }
        }
        addafter(KNH_Dictionary)
        {
            action(KNH_SystemFunctions) //609
            {
                ApplicationArea = All;
                ToolTip = 'System Functions';
                Caption = 'System Functions';
                RunObject = codeunit "KNH System Functions";
            }
        }
        addafter(KNH_SystemFunctions)
        {
            action(KNH_TransferFields)
            {
                ApplicationArea = All;
                ToolTip = 'TransferFields';
                Caption = 'TransferFields';
                RunObject = codeunit "KNH Transfer Fields";
            }
        }
        addafter(KNH_TransferFields)
        {
            action(KNH_VariantTest)
            {
                ApplicationArea = All;
                ToolTip = 'Variant Test';
                Caption = 'Variant Test';
                RunObject = codeunit "KNH Variant Test";
            }
        }
        addafter(KNH_VariantTest)
        {
            action(KNH_RecordRef)
            {
                ApplicationArea = All;
                ToolTip = 'Record Link Export';
                Caption = 'Record Link';
                RunObject = codeunit "KNH RecordRef";
            }
        }
        addafter(KNH_RecordRef)
        {
            action(KNH_Notes)
            {
                ApplicationArea = All;
                ToolTip = 'Notes';
                Caption = 'Notes';
                RunObject = page "KNH Notes";
            }
        }
        addafter(KNH_Notes)
        {
            action(KNH_Source)
            {
                ApplicationArea = All;
                ToolTip = 'Open sources page.';
                Caption = 'Sources';
                RunObject = page "KNH Sources";
            }
        }
        addafter(KNH_Source)
        {
            action(KNH_Rename)
            {
                ApplicationArea = All;
                ToolTip = 'Rename';
                Caption = 'Rename';
                RunObject = codeunit "KNH Rename";
            }
        }
        addafter(KNH_Rename)
        {
            action(KNH_SendEmail)
            {
                ApplicationArea = All;
                ToolTip = 'Send Email';
                Caption = 'Send Email';
                RunObject = codeunit "KNH Send Email";
            }
        }
        addafter(KNH_SendEmail)
        {
            action(KNH_ErrorLog)
            {
                ApplicationArea = All;
                ToolTip = 'Error Log';
                Caption = 'Error Log';
                RunObject = codeunit "KNH Error Log";
            }
        }
        addafter(KNH_ErrorLog)
        {
            action(KNH_ChangeCompany)
            {
                ApplicationArea = All;
                ToolTip = 'Change Company';
                Caption = 'Change Company';
                RunObject = codeunit "KNH Change Company";
            }
        }
        addafter(KNH_ChangeCompany)
        {
            action(KNH_MarkedCustomers)
            {
                ApplicationArea = All;
                ToolTip = 'Marked Customers';
                Caption = 'Marked Customers';
                RunObject = codeunit "KNH Marked Customers";
            }
        }
        addafter(KNH_MarkedCustomers)
        {
            action(KNH_UseStandardError)
            {
                ApplicationArea = All;
                ToolTip = 'Standard Error';
                Caption = 'Standard Error';
                RunObject = codeunit "KNH Use Standard Error";
            }
        }
        addafter(KNH_UseStandardError)
        {
            action(KNH_TryFunction)
            {
                ApplicationArea = All;
                ToolTip = 'Try Function';
                Caption = 'Try Function';
                RunObject = codeunit "KNH Try Function";
            }
        }
        addafter(KNH_TryFunction)
        {
            action(KNH_Prompt)
            {
                ApplicationArea = All;
                ToolTip = 'Draft a proposal';
                Caption = 'Draft a proposal';
                RunObject = page "KNH Prompt Dialog";
            }
        }
        addafter(KNH_TryFunction)
        {
            action(KNH_API)
            {
                ApplicationArea = All;
                ToolTip = 'Show Cat Fact';
                Caption = 'Show Cat Fact';
                RunObject = codeunit "KNH API Management";
            }
        }
    }
}