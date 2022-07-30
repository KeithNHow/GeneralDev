/// <summary>
/// Codeunit KNH Streaming (ID 50010).
/// </summary>
codeunit 50010 "KNH Streaming"
{
    local procedure StreamImport()
    var
        myInStream: InStream;
        myText: Text[100];
    begin
        myText := 'I am a very old man.';
        myInStream.ReadText(myText);
        Message(Format(myInStream));
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
        myOutStream.WriteText('<P>Hello world!</p>');
        myOutStream.WriteText;
        myOutStream.WriteText('</html>');
    end;
}
