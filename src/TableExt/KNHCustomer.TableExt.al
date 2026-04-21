namespace KNHGenDev;
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
            AllowInCustomizations = AsReadWrite;

            trigger OnValidate()
            var
            //KNHSetSingleInstance: Codeunit "KNH Set Single Instance";
            begin
                //KNHSetSingleInstance.SetSingleInstance(IntegerField);
            end;
        }
    }
}