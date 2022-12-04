/// <summary>
/// Page KNH API (ID 50602).
/// </summary>
page 50602 "KNH API"
{
    Caption = 'KNH API';
    PageType = Card;
    SourceTable = "KNH API";


    layout
    {
        area(content)
        {
            group(General)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Id field.';
                }
            }
        }
    }
}
