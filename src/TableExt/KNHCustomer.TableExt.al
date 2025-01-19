namespace KNHTest;
using Microsoft.Sales.Customer;

tableextension 50601 "KNH Customer" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50600; IntegerField; Integer)
        {
            Caption = 'Integer Field';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                KNHSingleInstance: Codeunit "KNH Single Instance";
            begin
                KNHSingleInstance.SetSingleInstance(IntegerField);
            end;
        }
    }
}