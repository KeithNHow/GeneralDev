/// <summary>
/// Codeunit "KNH Streaming" (ID 50610).
/// InStream --> Creates a stream object that you can use to read from or write to files and BLOBs.
/// OutStream --> Creates a stream object that you can use to write to files and BLOBs.
/// </summary>

namespace KNHTest;
using Microsoft.Foundation.Company;
codeunit 50610 "KNH Streaming"
{
    trigger OnRun()
    begin
        this.StreamImport();
        this.InStreamCompanyInfo();
        this.StreamOutput();
    end;

    local procedure StreamImport()
    var
        myInStream: InStream;
        myText: Text;
    begin
        myText := 'I am a very old man.';
        myInStream.ReadText(myText);
        Message(Format(myInStream));
    end;

    local procedure InStreamCompanyInfo()
    var
        RecCompanyInformation: Record "Company Information";
        varInstream: InStream;
        numChars: Integer;
        TextStreamLbl: Label 'Number of characters read: %1. Characters read: %2.', Comment = '%1 = No. of Characters. ; %2 = First three Characters.';
        varChars: Text[50];
    begin
        RecCompanyInformation.Find('-');
        RecCompanyInformation.CalcFields(RecCompanyInformation.Picture); //retrieves the Picture field
        RecCompanyInformation.Picture.CreateInStream(varInstream); //places Picture blob into stream object
        numChars := varInstream.Read(varChars, 3);  //reads first three characters of picture stream
        Message(TextStreamLbl, numChars, varChars);
    end;

    local procedure StreamOutput()
    var
        myOutStream: OutStream;
    begin
        myOutStream.WriteText('<html>');
        myOutStream.WriteText();
        myOutStream.WriteText('<head>');
        myOutStream.WriteText('<title>My Page</title>');
        myOutStream.WriteText('</head>');
        myOutStream.WriteText();
        myOutStream.WriteText('<p>Hello world!</p>');
        myOutStream.WriteText();
        myOutStream.WriteText('</html>');
    end;
}
