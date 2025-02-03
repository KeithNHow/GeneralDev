/// <summary>
/// XmlPort "KNH Source" (ID 50600).
/// </summary>

namespace KNHGenDev;

xmlport 50600 "KNH Source"
{
    Caption = 'Source Import';
    TextEncoding = UTF8;
    Format = VariableText;
    Direction = Import;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Source; "KNH Source")
            {
                XmlName = 'Source';
                RequestFilterFields = Code;

                fieldelement(Code; Source.Code)
                {
                    trigger OnAfterAssignField()
                    begin

                    end;
                }
                fieldelement(Name; Source.Name)
                {
                    trigger OnAfterAssignField()
                    begin
                    end;
                }

                trigger OnAfterInitRecord()
                begin
                    if SkipFirstRecord then begin
                        SkipFirstRecord := false;
                        currXMLport.Skip();
                    end;
                end;
            }
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(Skip_First_Record; SkipFirstRecord)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Skip First Record';
                        ToolTip = 'Skip first record in import file.';
                    }
                }
            }
        }

        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnInitXmlPort()
    begin
        SkipFirstRecord := true;
    end;

    trigger OnPreXmlPort()
    begin
    end;

    trigger OnPostXmlPort()
    begin
    end;

    var
        SkipFirstRecord: Boolean;
}
