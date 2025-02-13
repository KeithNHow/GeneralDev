// Display Imported records in Cat Fact table
// Action added to link import of records (CU API Mgmt)   

namespace GeneralDev.GeneralDev;

page 50606 "KNH Cat Facts"
{
    ApplicationArea = All;
    Caption = 'Cat Facts';
    PageType = List;
    SourceTable = "KNH Cat Fact";
    UsageCategory = Lists;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Fact; Rec.Fact)
                {
                    ToolTip = 'Specifies the value of the Fact field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetCatFact)
            {
                Caption = 'Get Cat Fact';
                ToolTip = 'Get a Cat Fact from Restful API';
                Image = Import;
                trigger OnAction()
                var
                    KNHAPIManaagement: Codeunit "KNH API Management";
                begin
                    KNHAPIManaagement.RestShowCatFact();
                end;
            }
        }

        area(Promoted)
        {
            actionref(GetCatFact_Ref; GetCatFact) { }
        }

    }
}
