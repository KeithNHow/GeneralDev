//Prompt Dialog Test
namespace KNHTest;

page 50605 "KNH Prompt Dialog"
{
    ApplicationArea = All;
    Caption = 'Create a draft';
    PageType = PromptDialog;
    Extensible = false;
    PromptMode = Prompt;
    IsPreview = true;
    DataCaptionExpression = this.UserInput;
    SourceTable = "KNH Temp Input Data";
    SourceTableTemporary = true;
    InstructionalText = 'Enter information that describes that you want to give Copilot...', MaxLength = 250;

    layout
    {
        area(Content)
        {
            field(generatedOutput; this.Output)
            {
                ShowCaption = false;
                MultiLine = true;
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
                    // The code triggering the Copilot interaction. This is where you call the Copilot API, and get the results back. You must implement this yourself. 
                    this.RunGeneration();
                end;
            }
            systemaction(Attach)
            {
                Caption = 'Attach a file';
                ToolTip = 'Attach a file describing the job.';
                trigger OnAction()
                var
                    InStr: InStream;
                    Filename: Text;
                begin
                    UploadIntoStream('Select a file...', '', 'All files (*.*)|*.*', Filename, InStr);
                    if Filename <> '' then;
                end;
            }
            systemaction(OK)
            {
                Caption = 'Save';
                ToolTip = 'Save the draft.';
            }
            systemaction(Cancel)
            {
                Caption = 'Cancel';
                ToolTip = 'Throw away the draft.';
            }
            systemaction(Regenerate)
            {
                Caption = 'Regenerate';
                ToolTip = 'Regenerate the code';
                trigger OnAction()
                begin
                    this.RunGenerate();
                end;
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        SaveCopilotJobProposal: Codeunit "KNH Save Copilot Job Proposal";
    begin
        if CloseAction = CloseAction::OK then
            SaveCopilotJobProposal.Save(this.CustomerNo, this.CopilotJobProposal);
    end;

    var
        InputProjectDescription: Text;
        Tone: option;
        Format: Option;
        Emphasis: Option;
        Output: Text;
        CustomerNo: Code[20];
        CopilotJobProposal: Text;
        userinput: Text;

    procedure RunGeneration()
    begin

    end;

    procedure RunGenerate()
    begin

    end;
}