table 50604 "KNH Blob"
{
    Caption = 'Blob Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Id; Integer)
        {

        }
        field(2; Blobfield; Blob)
        {

        }
    }

    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }

    procedure SetBlobValue(Value: Text)
    var
        FileInStream: InStream;
    begin
        CalcFields(Blobfield);
        if BlobField.HasValue then begin
            Blobfield.CreateInStream(FileInStream);
            FileInStream.ReadText(Value);
        end else
            Value := 'Blob field. has no value.';
    end;
}