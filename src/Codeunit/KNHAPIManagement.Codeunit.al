//Alberto Soben - new REST client

namespace KNHGenDev;
using System.RestClient;
codeunit 50647 "KNH API Management"
{
    trigger OnRun()
    begin
        ShowCatFact();
        ShowCatFact2();
    end;

    //Read cat fact
    procedure ShowCatFact()
    var
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        UrlLbl: Label 'https://catfact.ninja/fact';
        Response: Text;
    begin
        if HttpClient.Get(UrlLbl, HttpResponseMessage) then begin
            HttpResponseMessage.Content.ReadAs(Response);
            Message(Response);
        end;
    end;

    //Show Cat fact content
    procedure ShowCatFact2()
    var
        RestClient: Codeunit "Rest Client";
        UrlLbl: Label 'https://catfact.ninja/fact';
    begin
        Message(RestClient.Get(UrlLbl).GetContent().AsText());
    end;
}