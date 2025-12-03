table 50607 "KNH Purchase Header"
{
    DataClassification = ToBeClassified;
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            DataClassification = CustomerContent;
        }
        field(2; Status; Code[10]) //draft
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(3; Type; Code[10]) //invoice
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(4; "Vendor No."; Code[20])
        {
            Caption = 'Suppliuer';
            DataClassification = CustomerContent;
        }
        field(5; "Invoice No."; Code[20])
        {
            Caption = 'Supplier Invoice No.';
            DataClassification = CustomerContent;
        }
        field(6; "Order No."; Code[10])
        {
            Caption = 'Purchase Order No.';
            DataClassification = CustomerContent;
        }
        field(7; "Invoice Date"; Date)
        {
            Caption = 'Invoice Date';
            DataClassification = CustomerContent;
        }
        field(8; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(9; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
        }
        field(10; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
            DataClassification = CustomerContent;
        }
        field(11; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
            DataClassification = CustomerContent;
        }
        field(12; "Currency Exchange Rate"; Decimal)
        {
            Caption = 'currency Exchange Rate';
            DataClassification = CustomerContent;
        }
        field(13; "Date Added"; Date)
        {
            Caption = 'Created Date';
            DataClassification = CustomerContent;
        }
        field(14; "Submitted Date"; Date)
        {
            Caption = 'Submitted Date';
            DataClassification = CustomerContent;
        }
        field(15; "Approved Date"; Date)
        {
            Caption = 'Approved Date';
            DataClassification = CustomerContent;
        }
        field(16; "Rejected Date"; Date)
        {
            Caption = 'Rejected Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Id", Status, Type, "Vendor No.", "Invoice No.")
        {
        }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;
}