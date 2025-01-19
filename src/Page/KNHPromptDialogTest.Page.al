namespace KNHTest;

page 50607 "KNH Prompt Dialog Test"
{
    PageType = PromptDialog;
    ApplicationArea = All;
    Caption = 'Prompt Test';
    PromptMode = Prompt;
    Extensible = false;

    layout
    {
        area(Prompt)
        {

        }
        area(PromptOptions)
        {

        }
        area(Content)
        {

        }
    }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                ToolTip = 'XXX';
                trigger OnAction()
                begin

                end;
            }
        }
    }

}