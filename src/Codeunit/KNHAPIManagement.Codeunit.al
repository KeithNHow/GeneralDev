//Old Http client and new rest client

namespace KNHGenDev;
using System.RestClient;
codeunit 50647 "KNH API Management"
{
    trigger OnRun()
    var
        Selection: Integer;
        options: Text;
        functionLbl: Label 'Cat fact by http,Cat fact by reset';
        selectionLbl: Label 'Choose one of the following options:';
    begin
        options := functionLbl;
        selection := Dialog.StrMenu(options, 1, selectionLbl);
        case selection of
            1:
                this.HttpShowCatFact();
            2:
                this.RestShowCatFact();
        end;
    end;

    //Show cat fact using httpclient
    procedure HttpShowCatFact()
    var
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        UrlLbl: Label 'https://catfact.ninja/fact';
        Response: Text;
    begin
        if HttpClient.Get(UrlLbl, HttpResponseMessage) then begin //call url and receive response
            HttpResponseMessage.Content.ReadAs(Response); //reads response and places in text variable
            Message(Response);
        end else
            Message('Error: ' + HttpResponseMessage.ReasonPhrase);
    end;

    //Show Cat fact using rest client
    procedure RestShowCatFact()
    var
        RestClient: Codeunit "Rest Client";
        UrlLbl: Label 'https://catfact.ninja/fact';
    begin
        Message(RestClient.Get(UrlLbl).GetContent().AsText());
    end;
}