///<Summary>
///Codeunit loops through each Company record in database. For each company record found company name (PK) is used to change to another company. A loop of customer records then occurs with the name 2 field modified. On exit of the loop a message is displayed.    
///</Summary>
namespace KNHGenDev;
using Microsoft.Sales.Customer;
using System.Environment;

codeunit 50622 "KNH Change Company"
{
    trigger OnRun()
    var
        Company: Record Company;
        Customer: Record Customer;
    begin
        if Company.FindSet() then
            repeat
                Company.ChangeCompany(Company.Name);
                if Customer.FindSet(true) then
                    repeat
                        Customer."Name 2" := 'X';
                        Customer.Modify();
                    until Customer.Next() = 0;
            until Company.Next() = 0;
        Message('Update complete for all Companies');
    end;
}
