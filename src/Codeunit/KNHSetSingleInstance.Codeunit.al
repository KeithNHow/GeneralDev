namespace KNHGenDev;

codeunit 50626 "KNH Set Single Instance"
{
    SingleInstance = true;

    trigger OnRun()
    begin
        this.SetSingleInstance();
        Message(Format('Message has been set'));
    end;

    var
        MyText: Text[100];

    procedure SetSingleInstance()
    begin
        this.MyText := 'You Found Me';
    end;

    procedure GetSingleInstance() TheText: Text[100];
    begin
        TheText := this.MyText;
    end;
}