namespace KNHGenDev;

codeunit 50648 "KNH Display Company Name"
{
    trigger OnRun()
    var
        DisplayMsg: Label 'Company Name is ''%1'' \\Company Display Name is ''%2''\\Company URL Name is ''%3''', comment = '%1, %2, %3 = This message is displayed when the codeunit is run.';
    begin
        Message(DisplayMsg, CompanyName(), CompanyProperty.DisplayName(), CompanyProperty.URLName());
    end;
}