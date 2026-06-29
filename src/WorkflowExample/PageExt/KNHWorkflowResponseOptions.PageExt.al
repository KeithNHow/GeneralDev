///<Summary>
///Page extension to display extra field for new event responses.
///</Summary>
namespace KNHGenDev;
using System.Automation;

pageextension 50661 "KNH Workflow Response Options" extends "Workflow Response Options"
{
    layout
    {
        addlast(content)
        {
            group(Group50100)
            {
                Visible = Rec."Response Option Group" = 'GROUP 50100';
                ShowCaption = false;

                field(KNHResponseOption; Rec."My New Response Option")
                {
                    ApplicationArea = All;
                    ToolTip = 'This is a new response option added to the workflow response options page extension.';
                }
            }
        }
    }
}