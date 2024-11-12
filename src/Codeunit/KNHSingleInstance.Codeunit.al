codeunit 50626 "KNH Single Instance"
{
    SingleInstance = true;

    var
        StoredInteger: Integer;

    procedure SetSingleInstance(IntegerField: Integer)
    begin
        StoredInteger := IntegerField;
    end;

    procedure GetSingleInstance(): Integer
    begin
        exit(StoredInteger);
    end;
}