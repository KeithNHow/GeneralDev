pageextension 50620 "KNH CustomerCard" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(IntegerField; Rec.IntegerField)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies integer to be displayed on Vendor Card.';
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            fileuploadaction(ProductImageUpload)
            {
                Caption = 'Upload Image';
                ToolTip = 'Product Image Upload.';
                ApplicationArea = Basic, Suite;
                AllowMultipleFiles = true;
                AllowedFileExtensions = '.jpg', '.jpeg', '.png', '.pdf';
                trigger OnAction(Files: List of [FileUpload])
                var
                    CurrentFile: FileUpload;
                    FileInStream: InStream;
                begin
                    foreach CurrentFile in Files do begin
                        CurrentFile.CreateInStream(FileInStream, TextEncoding::UTF8);
                        // Code here to handle the file
                        Rec.Image.ImportStream(FileInStream, '');
                        Message('%1 has a size of %2.', CurrentFile.FileName, Format(Round(FileInStream.Length / 1024, 1)) + ' KB');
                    end;
                    Rec.Modify(true);
                end;
            }
        }
    }
}