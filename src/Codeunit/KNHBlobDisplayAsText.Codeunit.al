namespace KNHGenDev;
using Microsoft.Sales.Document;
using System.Utilities;

codeunit 50651 "KNH Blob Display As Text"
{
    TableNo = "Sales Header";

    trigger OnRun()
    var
        TempBlob: Codeunit "Temp Blob";
        MyInStream: InStream;
        Txt: Text;
    begin
        Rec.SetRange("Document Type", Rec."Document Type"::Invoice);
        Rec.SetRange("Sell-to Customer No.", '10000');
        Rec.SetRange("No.", '102199');
        Rec.SetAutoCalcFields("Work Description");
        if Rec.FindFirst() then begin
            Rec."Work Description".CreateInStream(MyInStream, TextEncoding::UTF8); // Creates and writes data to instream object
            TempBlob.CreateOutStream(); // Creates an outstream object
            // Loop to read the text from the InStream
            while not MyInStream.EOS do begin
                MyInStream.ReadText(Txt, 5); // Reads 5 characters from instream object
                Message(Txt); // Display the text character
            end;
        end;
    end;
}