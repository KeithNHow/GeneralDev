//Prompt Dialog Test
namespace KNHGenDev;

page 50605 "KNH Prompt Dialog"
{
    ApplicationArea = All;
    Caption = 'Create a draft';
    PageType = PromptDialog;
    Extensible = false;
    PromptMode = Prompt;
    IsPreview = true;
    DataCaptionExpression = this.userinput;
    SourceTable = "KNH Temp Input Data";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            field(generatedOutput; this.Output)
            {
                ShowCaption = false;
                MultiLine = true;
                InstructionalText = 'Enter information that describes that you want to give Copilot...', MaxLength = 250;
            }
        }
        area(PromptOptions)
        {
            field(tone; this.Tone)
            {
                ToolTip = 'Select the tone of the generated text.';
                OptionCaption = 'Tone';
            }
            field(format; this.Format)
            {
                ToolTip = 'Select the format of the generated text.';
                OptionCaption = 'Format';
            }
            field(emphasis; this.Emphasis)
            {
                ToolTip = 'Select the emphasis of the generated text.';
                OptionCaption = 'Emphasis';
            }
        }
    }

    actions
    {
        area(PromptGuide)
        {
            action(MyPromptAction)
            {
                Caption = 'How can I [do this]';
                ToolTip = 'Ask Copilot for help with a specific task.';
                trigger OnAction()
                begin
                    this.InputProjectDescription := 'How can I [do this]';
                end;
            }
        }
        area(SystemActions)
        {
            systemaction(Generate)
            {
                Caption = 'Generate';
                ToolTip = 'Generate the code';
                trigger OnAction()
                begin
                    // The code triggering the Copilot interaction. This is where you call the Copilot API, and get the results back.
                    this.RunGenerate(this.CopilotGeneratingTxt);
                end;
            }
            systemaction(Regenerate)
            {
                Caption = 'Regenerate';
                ToolTip = 'Regenerate the code';
                trigger OnAction()
                begin
                    this.RunGenerate(this.CopilotRegeneratingTxt);
                end;
            }
            systemaction(Ok)
            {
                Caption = 'Save';
                ToolTip = 'Save the draft.';
            }
            systemaction(Cancel)
            {
                Caption = 'Cancel';
                ToolTip = 'Throw away the draft.';
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        KNHSaveCopilotJobProposal: Codeunit "KNH Save Copilot Job Proposal";
    begin
        if CloseAction = CloseAction::OK then
            KNHSaveCopilotJobProposal.Save(this.CustomerNo, this.CopilotJobProposal);
    end;



    var
        CustomerNo: Code[20];
        GenerateModeProgDialog: Dialog;
        CopilotGeneratingTxt: Label 'Creating a draft for you...';
        CopilotRegeneratingTxt: Label 'Revising the draft...';
        Emphasis: Option;
        Format: Option;
        Tone: option;
        CopilotJobProposal: Text;
        InputProjectDescription: Text;
        Output: Text;
        userinput: Text;

    procedure RunGeneration()
    begin

    end;

    procedure RunGenerate(ProgressTxt: Text)
    begin
        this.GenerateModeProgDialog.Open(ProgressTxt);
    end;
}