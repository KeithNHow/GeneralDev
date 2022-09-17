/// <summary>
/// Page KNH Notes (ID 50600).
/// </summary>
page 50600 "KNH Notes"
{
    Caption = 'KNH Notes';
    PageType = Card;
    SourceTable = "KNH Note";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Link ID"; Rec."Link ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Link ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Note; Rec.Note)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Note field.';
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created field.';
                }
                field("To User ID"; Rec."To User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To User ID field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }
}
