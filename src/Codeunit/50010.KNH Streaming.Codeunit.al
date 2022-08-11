/// <summary>
/// Codeunit KNH Streaming (ID 50010).
/// InStream --> Creates a stream object that you can use to read from or write to files and BLOBs.
/// OutStream --> Creates a stream object that you can use to write to files and BLOBs.
/// </summary>
codeunit 50010 "KNH Streaming"
{
    trigger OnRun()
    begin
        StreamImport();
        InStreamCompanyInfo();
        StreamOutput();
    end;

    local procedure StreamImport()
    var
        myInStream: InStream;
        myText: Text[100];
    begin
        myText := 'I am a very old man.';
        myInStream.ReadText(myText);
        Message(Format(myInStream));
    end;

    local procedure InStreamCompanyInfo()
    var
        recCompInfo: Record "Company Information";
        varInstream: Instream;
        varChars: Text[50];
        numChars: Integer;
        TextStream: Label 'Number of characters read: %1. Characters read: %2.';
    begin
        recCompInfo.Find('-');
        recCompInfo.CalcFields(recCompInfo.Picture); //retrieves the Picture field
        recCompInfo.Picture.CreateInStream(varInstream); //places Picture blob into stream object
        numChars := varInstream.Read(varChars, 3);  //reads first three characters of picture stream
        Message(TextStream, numChars, varChars);
    end;

    local procedure StreamOutput()
    var
        myOutStream: OutStream;
    begin

        myOutStream.WriteText('<html>');
        myOutStream.WriteText;
        myOutStream.WriteText('<head>');
        myOutStream.WriteText('<title>My Page</title>');
        myOutStream.WriteText('</head>');
        myOutStream.WriteText;
        myOutStream.WriteText('<p>Hello world!</p>');
        myOutStream.WriteText;
        myOutStream.WriteText('</html>');
    end;
}
