codeunit 50643 "KNH Online File handling"
{
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
    //loads record from client file into stream
    //imports field value from stream into item fields
    //either insets or updates item record
    procedure UploadCSV()
    var
        CSVBuffer: Record "CSV Buffer";
        Item: Record Item;
        CSVInstream: InStream;
        DialogCaption, CSVFileName : Text;
        UploadResult: Boolean;
    begin
        UploadResult := UploadIntoStream(DialogCaption, '', '', CSVFileName, CSVInstream);
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
}