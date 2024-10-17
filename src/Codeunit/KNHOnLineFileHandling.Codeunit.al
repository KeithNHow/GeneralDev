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
    //3 - either insets or updates item record
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
}