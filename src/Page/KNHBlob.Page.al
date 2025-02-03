// Page KNH Blob Card (ID 53602).

namespace KNHGenDev;

page 50612 KNHBlob
{
    PageType = Card;
    Caption = 'Blob Card';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "KNH Blob";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(PK; Rec.PK)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PK field.';
                }
                group(Long_Description)
                {
                    Caption = 'Long Description';
                    field(LongDescription; this.LongDescription)
                    {
                        ApplicationArea = Basic, Suite;

                        MultiLine = true;
                        ShowCaption = false;
                        ToolTip = 'Specifies a Long Description.';

                        trigger OnValidate()
                        begin
                            Rec.SetLongDescription(this.LongDescription);
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        this.LongDescription := Rec.GetLongDescription();
    end;

    var
        LongDescription: Text;
}