namespace KNHGenDev;
using System.Reflection;

table 50604 "KNH Blob"
{
    Caption = 'Blob Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; PK; Code[20])
        {
            Caption = 'PK';
            AllowInCustomizations = Never;
        }
        field(2; "Long Description"; Blob)
        {
            Caption = 'Blob';
            DataClassification = CustomerContent;
            AllowInCustomizations = Never;
        }
    }

    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }

    var
        ReadingDataSkippedMsg: Label 'Loading field %1 will be skipped because there was an error when reading the data.\To fix the current data, contact your administrator.\Alternatively, you can overwrite the current data by entering data in the field.', Comment = '%1=field caption';

    /// <summary>
    /// SetBlob.
    /// </summary>
    /// <param name="NewLongDescription">Text.</param>
    procedure SetLongDescription(NewLongDescription: Text)
    var
        OutStream: OutStream;
    begin
        Clear(Rec."Long Description");
        Rec."Long Description".CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(NewLongDescription);
        Rec.Modify();
    end;

    /// <summary>
    /// GetLongDescription.
    /// </summary>
    /// <returns>Return variable LongDescription of type Text.</returns>
    procedure GetLongDescription() LongDescription: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        this.CalcFields("Long Description");
        "Long Description".CreateInStream(InStream, TextEncoding::UTF8);
        if not TypeHelper.TryReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator(), LongDescription) then
            Message(this.ReadingDataSkippedMsg, this.FieldCaption("Long Description"));
    end;
}