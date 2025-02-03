namespace KNHGenDev;
using Microsoft.Foundation.Attachment;
using Microsoft.Sales.Customer;

pageextension 50622 "KNH Document Attachments" extends "Document attachment Details"
{
    actions
    {
        addlast(Processing)
        {
            fileuploadaction(ProductImageUpload)
            {
                Caption = 'Upload Document';
                ToolTip = 'Upload document attachment.';
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
                        Rec."Table ID" := Database::Customer;
                        Rec."No." := '10000';
                        Rec."Document Type" := Rec."Document Type"::Quote;
                        Rec."Line No." := 20000;
                        Rec.ID := 4;
                        Rec."Document Reference ID".ImportStream(FileInStream, '');
                    end;
                    Rec.Insert(true);
                end;
            }
        }
    }
}