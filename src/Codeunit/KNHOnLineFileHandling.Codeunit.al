//
codeunit 50643 "KNH Online File handling"
{
    //On Prem create file gives error 
    [Scope('OnPrem')]
    procedure Testfiles()
    var
    //MyFile: File;
    begin
        //MyFile.Create('C:\Temp\MyFile.txt', TextEncoding::MSDos);
    end;

    //adds a picture to an item
    //loads client file into stream
    //imports the picture from stream
    procedure ImportItemPicture()
    var
        Item: Record Item;
        FileInstream: InStream;
        DialogCaption, FileName : Text;
    begin
        if Item.FindFirst() then
            if UploadIntoStream(DialogCaption, '', '', FileName, FileInstream) then begin
                Clear(Item.Picture);
                Item.Picture.ImportStream(FileInstream, FileName);
                Item.Modify(true);
            end;
    end;

    //imports file record into item record
    //1 - loads record from client file into stream
    //2 - imports each field value from stream into item field
    //3 - either inserts or updates item record
    procedure UploadCSV()
    var
        CSVBuffer: Record "CSV Buffer";
        Item: Record Item;
        CSVInstream: InStream;
        DialogCaption, CSVFileName : Text;
    begin
        UploadIntoStream(DialogCaption, '', '', CSVFileName, CSVInstream);
        CSVBuffer.DeleteAll();
        CSVBuffer.LoadDataFromStream(CSVInstream, ',');
        if CSVBuffer.FindSet() then
            repeat
                if CSVBuffer."Field No." = 1 then
                    Item.Init();
                case CSVBuffer."Field No." of
                    1:
                        Item.Validate("No.", CSVBuffer.Value);
                    2:
                        Item.Validate(Description, CSVBuffer.Value);
                    3:
                        Item."Item Category Code" := CopyStr(CSVBuffer.Value, 1, 20);
                    else
                        if not Item.Insert(true) then
                            Item.Modify(true);
                end;
            until CSVBuffer.Next() = 0;
    end;

    //exports item record into file record
    //1 - checks if any item contains pic
    //2 - loops through items
    //3 - create filename
    //4 - create stream containing pic
    //5 - Download from stream to local computer
    procedure DownloadCSV()
    var
        Item: Record Item; //app table
        TenantMedia: Record "Tenant Media"; //system table
        FileInStream: InStream;
        DialogTitle: Text;
        ToFolder: Text;
        ToFilter: Text;
        FileName: Text;
        i: Integer;
        ErrMsg: Label 'No images stored for the selectd item.';
    begin
        if Item.Picture.Count() = 0 then
            Error(ErrMsg);
        for i := 1 to Item.Picture.Count() do begin
            if TenantMedia.Get(Item.Picture.MediaId()) then
                TenantMedia.CalcFields(Content);
            if TenantMedia.Content.HasValue then begin
                FileName := Item."No." + '' + Format(i) + GetImageExtension(TenantMedia);
                TenantMedia.Content.CreateInStream(FileInStream);
                DownloadFromStream(FileInStream, DialogTitle, ToFolder, ToFilter, FileName);
            end;
        end;
    end;

    local procedure GetImageExtension(var TenantMedia: Record "Tenant Media"): Text
    begin
        case TenantMedia."Mime Type" of
            'image/jpeg':
                exit('.jpg');
            'image/bmp':
                exit('.bmp');
            'image/gif':
                exit('.gif');
            'image/png':
                exit('.png');
            'image/tiff':
                exit('.tiff');
            'image/wmf':
                exit('.wmf');
        end;
    end;

    procedure CreateTextFile(FileName: Text)
    var
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;
        CR, LF : char;
    begin
        CR := 13;
        LF := 10;
        TempBlob.CreateOutStream(OutStream);
        OutStream.WriteText('First line' + CR + LF);
        OutStream.WriteText('Second line' + CR + LF);
        OutStream.WriteText('Third line' + CR + LF);
        TempBlob.CreateInStream(InStream);
        DownloadFromStream(InStream, '', '', '', FileName);
    end;

    //Upload file to the attachment table
    //upload file into file instream
    //Create attachment record
    //Create file outstream
    //transfer file to outstream   

    procedure UploadAttachment()
    var
        Attachment: Record Attachment;
        FileMgt: Codeunit "File Management";
        FileInStream: InStream;
        FileOutStream: OutStream;
        TempFileName: Text;
        DialogTitleTxt: Label 'Select file to upload';
    begin
        if UploadIntoStream(DialogTitleTxt, '', 'All Files (*.*)|*.*', TempFileName, FileInStream) then begin
            Attachment.Init();
            Attachment.Insert(true);
            Attachment."Storage Type" := Attachment."Storage Type"::Embedded;
            Attachment."Storage Pointer" := '';
            Attachment."File Extension" := CopyStr(FileMgt.GetExtension(TempFileName), 1, MaxStrLen(Attachment."File Extension"));
            Attachment."Attachment File".CreateOutStream(FileOutStream);
            Copystream(FileOutStream, FileInStream);
            Attachment.Modify(true);
        end;
    end;

    //Download file from the attachment table
    //Create instream and transfer file 
    //Create filename
    //Download file from file instream
    procedure DownloadAttachment(AttachmentEntryNo: Integer)
    var
        Attachment: Record Attachment;
        FileInStream: InStream;
        TempFileName: Text;
        ErrorAttachmentMsg: Label 'No attachment found';
    begin
        if Attachment.Get(AttachmentEntryNo) then
            if Attachment."Attachment File".HasValue then begin
                Attachment.CalcFields("Attachment File");
                Attachment."Attachment File".CreateInStream(FileInStream);
                TempFileName := CreateGuid() + '.' + Attachment."File Extension";
                DownloadFromStream(FileInStream, 'Save File', '', 'All files (*.*)|*.*', TempFileName);
            end else
                Error(ErrorAttachmentMsg);
    end;

    procedure LoadMedia()
    var
        Contact: Record Contact;
        FileInStream: InStream;
        FromFile: Text;
    begin
        if UploadIntoStream('Import Media', '', 'All files (*.*)|*.*', FromFile, FileInStream) then
            if Contact.FindFirst() then begin
                Clear(Contact.Image);
                Contact.Image.ImportStream(FileInStream, FromFile);
                Contact.Modify(true);
            end;
    end;

    procedure FindMediaOrphans()
    var
        TenantMedia: Record "Tenant Media";
        MediaOrphans: List of [Guid];
        MediaId: Guid;
    begin
        MediaOrphans := Media.FindOrphans(); //Find all orphaned media
        foreach MediaId in MediaOrphans do
            if TenantMedia.Get(MediaId) then //Is MediaId in Tenant Media record?
                TenantMedia.Delete();
    end;

    //Import XML from a file
    procedure RunXMLportImport()
    var
        FileInstream: InStream;
        FileName: Text;
    begin
        UploadIntoStream('Upload', '', 'All files (*.*)|*.*', FileName, FileInStream); //upload to instream
        Xmlport.Import(Xmlport::"KNH Source", FileInStream); //import from instream 
        Message('XML Import Successful');
    end;

    procedure RunXMLportExport()
    var
        TempBlob: Codeunit "Temp Blob";
        OutputFileName: Text;
        FileOutStream: OutStream;
        FileInStream: InStream;
    begin
        TempBlob.CreateOutStream(FileOutStream); //create outstream from temp blob table 
        XMLport.Export(XMLport::"KNH Source", FileOutStream); //export records to outstream
        TempBlob.CreateInStream(FileInStream); //create instream from temp blob
        OutputFileName := 'KNH Source.XML';
        DownloadFromStream(FileInStream, '', '', 'All files (*.*)|*.*', OutputFileName); //Download from instream 
    end;

    procedure ImportXMLDocument()
    var
        TempBlob: Codeunit "Temp Blob";
        TargetXMLDocument: XmlDocument;
        XmlDec: XmlDeclaration;
        FileInStream: InStream;
        Filename: Text;
    begin
        TargetXMLDocument := XmlDocument.Create();
        XmlDec := XmlDeclaration.Create('1.0', 'UTF-8', '');
        TargetXMLDocument.SetDeclaration(XmlDec);
        TempBlob.CreateInStream(FileInStream);
        Filename := 'data.xml';
        UploadIntoStream('Import XML', '', '', Filename, FileInStream);
        XmlDocument.ReadFrom(FileInStream, TargetXMLDocument);
    end;

    procedure XMLDocumentCreation()
    var
        XmlDoc: XmlDocument;
        XmlDec: XMLDeclaration;
        Node1, Node2 : XmlElement;
        Node: XmlNode;
    begin
        XmlDoc := XmlDocument.Create();
        XmlDec := XmlDeclaration.Create('1.0', 'UTF-8', '');
        XmlDoc.SetDeclaration(XmlDec);
        Node1 := XmlElement.Create('Node1');
        XmlDoc.Add(Node1);
        Node2 := XmlElement.Create('Node2');
        Node2.SetAttribute('ID', '3');
        XmlDoc.Add(Node2);
    end;

    procedure CreatJsonSalesOrder()
    var
        JsonObjectHeader: JsonObject;

    begin
        //XXXXX
        //YYYYY
        //ZZZZZ

        //Another Test
    end;
}