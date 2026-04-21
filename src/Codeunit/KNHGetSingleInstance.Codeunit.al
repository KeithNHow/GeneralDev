namespace KNHGenDev;

codeunit 50637 "KNH Get Single Instance"
{
    trigger OnRun()
    var
        KNHSetSingleInstance: Codeunit "KNH Set Single Instance";
        TheText: Text[100];
    begin
        TheText := KNHSetSingleInstance.GetSingleInstance();
        Message(TheText);
    end;
}