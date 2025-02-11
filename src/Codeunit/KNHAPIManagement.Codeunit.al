//Old Http client and new rest client

namespace KNHGenDev;
using System.RestClient;
codeunit 50647 "KNH API Management"
{
    trigger OnRun()
    begin
        this.ShowCatFact();
        //this.ShowCatFact2();
    end;

    //Show cat fact using httpclient
    procedure ShowCatFact()
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
    procedure ShowCatFact2()
    var
        RestClient: Codeunit "Rest Client";
        UrlLbl: Label 'https://catfact.ninja/fact';
    begin
        Message(RestClient.Get(UrlLbl).GetContent().AsText());
    end;
}