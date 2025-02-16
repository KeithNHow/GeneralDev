table 50608 "KNH Villains"
{
    Caption = 'Villains';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Gender; Text[20])
        {
            Caption = 'Gender';
        }
        field(4; Status; Text[20])
        {
            Caption = 'Status';
        }
        field(5; Types; Integer)
        {
            Caption = 'Types';
        }
        field(6; Notes; Text[1024])
        {
            Caption = 'Notes';
        }
        field(7; CreatedAt; DateTime)
        {
            Caption = 'CreatedAt';
        }
        field(8; books; Text[1024])
        {
            Caption = 'books';
        }
    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }
}
