// Import external records using APIMgmt CU and place in Cat Fact table  
table 50606 "KNH Cat Fact"
{
    Caption = 'Cat Fact';
    DataClassification = CustomerContent;
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; Fact; Text[1024])
        {
            Caption = 'Fact';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Fact)
        {
        }
    }
}
