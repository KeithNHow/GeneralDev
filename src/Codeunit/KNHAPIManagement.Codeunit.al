//Old Http client and New rest client

namespace KNHGenDev;
using System.RestClient;
codeunit 50647 "KNH API Management"
{
    trigger OnRun()
    var
        KNHCatFacts: Codeunit "KNH Cat Facts";
        Selection: Integer;
        options: Text;
        functionLbl: Label 'Show Cat fact Using http,Show Stephen King Villains using Rest,Insert Cat fact Using rest';
        selectionLbl: Label 'Choose one of the following options:';
    begin
        options := functionLbl;
        selection := Dialog.StrMenu(options, 1, selectionLbl);
        case selection of
            1:
                this.ShowCatFactUsingHttp();
            2:
                this.ShowStephenKingVillainsUsingRest();
            3:
                KNHCatFacts.InsertCatFactUsingRest();
            else
                Message('Invalid selection. Please try again.');
        end;
    end;

    //Show cat fact using httpclient
    procedure ShowCatFactUsingHttp()
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

    //Show cat fact using rest client
    procedure ShowStephenKingVillainsUsingRest()
    var
        RestClient: Codeunit "Rest Client";
        UrlLbl: Label 'https://stephen-king-api.onrender.com/api/villain/19';
    begin
        RestClient.Get(UrlLbl).GetContent().AsJson();
        Message(RestClient.Get(UrlLbl).GetContent().AsText());
    end;
}