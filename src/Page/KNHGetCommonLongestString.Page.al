namespace KNHGenDev;
using Microsoft.Bank.Reconciliation;

page 50600 "KNH Get Common Longest String"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Get Common Longest String';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(FirstString; this.FirstString)
                {
                    Caption = 'First String';
                    ApplicationArea = All;
                    ToolTip = 'First String';
                    trigger OnValidate()
                    begin
                        if FirstString = '' then
                            LongestCommonSubstring := '';
                        GetLongestCommonSubstring();
                    end;
                }
                field(SecondString; this.SecondString)
                {
                    Caption = 'Second String';
                    ToolTip = 'Second String';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if SecondString = '' then
                            LongestCommonSubstring := '';
                        GetLongestCommonSubstring();
                    end;
                }
                field(ThirdString; this.ThirdString)
                {
                    Caption = 'Third String';
                    ToolTip = 'Third String';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if SecondString = '' then
                            LongestCommonSubstring := '';
                        GetLongestCommonSubstring();
                    end;
                }
            }
            group(Result)
            {
                field(LongestCommonSubstring; this.LongestCommonSubstring)
                {
                    Caption = 'Longest Common Substring';
                    ToolTip = 'Longest Common Substring';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    var
        FirstString: Text;
        LongestCommonSubstring: Text;
        SecondString: Text;
        ThirdString: Text;

    local procedure GetLongestCommonSubstring()
    var
        RecordMatchMgt: Codeunit "Record Match Mgt.";
    begin
        if (this.FirstString <> '') and (this.SecondString <> '') and (this.ThirdString <> '') then
            this.LongestCommonSubstring := RecordMatchMgt.GetLongestCommonSubstring(RecordMatchMgt.GetLongestCommonSubstring(this.FirstString, this.SecondString), this.ThirdString);
    end;
}