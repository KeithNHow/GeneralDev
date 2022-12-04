/// <summary>
/// Table KNH API (ID 50601).
/// </summary>
table 50601 "KNH API"
{
    Caption = 'KNH API';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Guid)
        {
            Caption = 'Id';
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
}
