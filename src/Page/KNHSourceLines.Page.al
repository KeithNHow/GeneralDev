/// <summary>
/// Page KNH SourceLines (ID 50603).
/// </summary>

namespace KNHGenDev;

page 50603 "KNH Source Lines"
{
    ApplicationArea = All;
    Caption = 'Source Lines';
    PageType = List;
    SourceTable = "KNH Source Line";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
