namespace KNHGenDev;

codeunit 50626 "KNH Single Instance"
{
    SingleInstance = true;
    trigger OnRun()
    begin
        this.GetSingleInstance();
        Message(Format(this.StoredInteger));
    end;

    var
        StoredInteger: Integer;

    procedure SetSingleInstance(IntegerField: Integer)
    begin
        this.StoredInteger := IntegerField;
    end;

    procedure GetSingleInstance(): Integer
    begin
        exit(this.StoredInteger);
    end;
}