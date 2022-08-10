/// <summary>
/// Table KNH Blob (ID 50001).
/// In Saas, the Blob field is the only way to create streams.
/// </summary>
table 50000 "KNH Blob"
{
    TableType = Temporary;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[1])
        {
        }
        field(2; Blob; Blob)
        {
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    /// <summary>
    /// MoreTextLines.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure MoreTextLines(): Boolean
    begin

        if Not ReadLinesInitialized then
            StartReadingTextLines(TextEncoding::Windows);
        exit(Not GlobalInStream.EOS);
    end;

    /// <summary>
    /// StartReadingTextLines.
    /// </summary>
    /// <param name="Encoding">TextEncoding.</param>
    procedure StartReadingTextLines(Encoding: TextEncoding)

    begin
        Blob.CreateInStream(GlobalInStream, Encoding);
        ReadLinesInitialized := true;
    end;

    /// <summary>
    /// ReadTextLine.
    /// </summary>
    /// <returns>Return value of type Text.</returns>
    procedure ReadTextLine(): Text
    var
        ContentLine: Text;
    begin
        IF NOT MoreTextLines THEN
            exit('');

        GlobalInStream.ReadText(ContentLine);
        Exit(ContentLine);
    end;

    /// <summary>
    /// ReadAsText.
    /// </summary>
    /// <param name="LineSeparator">Text.</param>
    /// <param name="Encoding">Textencoding.</param>
    /// <returns>Return variable Content of type Text.</returns>
    procedure ReadAsText(LineSeparator: Text; Encoding: Textencoding) Content: Text

    var
        InStream: InStream;
        ContentLine: Text;

    begin
        Blob.CreateInStream(InStream, Encoding);

        InStream.ReadText(Content);

        while Not InStream.EOS do begin
            InStream.ReadText(ContentLine);
            Content += LineSeparator + ContentLine;
        end;
    end;

    /// <summary>
    /// WriteAsText.
    /// </summary>
    /// <param name="Content">Text.</param>
    /// <param name="Encoding">Textencoding.</param>
    procedure WriteAsText(Content: Text; Encoding: Textencoding)
    var
        OutStr: OutStream;
    begin
        CLEAR(Blob);
        if Content = '' then
            exit;

        Blob.CreateOutStream(OutStr, Encoding);
        OutStr.WriteText(Content);
    end;

    var
        GlobalInStream: InStream;
        GlobalOutStream: OutStream;
        ReadLinesInitialized: Boolean;
        WriteLinesInitialized: Boolean;
}
