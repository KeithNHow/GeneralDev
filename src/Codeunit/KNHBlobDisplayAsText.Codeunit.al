namespace KNHGenDev;
using Microsoft.Sales.Document;
codeunit 50651 "KNH Blob Display As Text"
{
    TableNo = "Sales Header";

    trigger OnRun()
    var
        InStream: InStream;
        Txt: Text;
    begin
        Rec.SetRange("Document Type", Rec."Document Type"::Invoice);
        Rec.SetRange("Sell-to Customer No.", '10000');
        Rec.SetRange("No.", '102199');
        Rec.SetAutoCalcFields("Work Description");
        if Rec.FindFirst() then begin
            Rec."Work Description".CreateInStream(InStream, TextEncoding::UTF8);
            // Loop to read the text from the InStream
            while not InStream.EOS do begin
                InStream.ReadText(Txt); // Read characters
                Message(Txt); // Display the read text
            end;
        end;
    end;
}