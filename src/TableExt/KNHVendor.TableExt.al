namespace KNHGenDev;
using Microsoft.Purchases.Vendor;

tableextension 50602 "KNH Vendor" extends Vendor
{
    fields
    {
        field(50600; IntegerField; Integer)
        {
            Caption = 'Integer Field';
            DataClassification = CustomerContent;
        }
    }
}