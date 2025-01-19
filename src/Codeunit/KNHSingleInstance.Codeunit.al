namespace KNHTest;

codeunit 50626 "KNH Single Instance"
{
    SingleInstance = true;

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