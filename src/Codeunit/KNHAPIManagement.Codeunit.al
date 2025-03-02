//Old Http client and new rest client

namespace KNHGenDev;
using System.RestClient;
codeunit 50647 "KNH API Management"
{
    trigger OnRun()
    var
        Selection: Integer;
        options: Text;
        functionLbl: Label 'Cat fact by http,Cat fact by rest,Stephen King Villains';
        selectionLbl: Label 'Choose one of the following options:';
    begin
        options := functionLbl;
        selection := Dialog.StrMenu(options, 1, selectionLbl);
        case selection of
            1:
                this.HttpShowCatFact();
            2:
                this.RestShowCatFact();
            3:
                this.RestShowStephenKingVillains();
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
        CatFactTxt: Text[1024];
        FactTxt: Text;
        WordTxt: List of [Text];
        EndPos: Integer;
        StartPos: Integer;
        Counter: Integer;
        A: Integer;
    begin
        CatFactTxt := CopyStr(RestClient.Get(UrlLbl).GetContent().AsText(), 1, 1024);
        Counter := 0;
        StartPos := 1;
        if StrPos(CatFactTxt, ' ') <> 0 then
            repeat
                EndPos := StrPos(CatFactTxt, ' ');
                Counter += 1;
                WordTxt.Insert(Counter, CopyStr(CatFactTxt, StartPos, EndPos));
                CatFactTxt := DelStr(CatFactTxt, StartPos, EndPos);
            until StrPos(CatFactTxt, ' ') = 0;
        Counter += 1;
        WordTxt.Insert(Counter, CatFactTxt);

        for A := 1 to Counter do begin
            FactTxt := WordTxt.Get(A);
            this.CreateCatFactRecord(FactTxt);
        end;
        Message(RestClient.Get(UrlLbl).GetContent().AsText());
    end;

    procedure CreateCatFactRecord(FactTxt: Text)
    var
        CatFact: Record "KNH Cat Fact";
    begin
        CatFact.Init();
        if CatFact.FindLast() then
            CatFact."No." := CatFact."No." + 1
        else
            CatFact."No." := 1;
        CatFact.Fact := CopyStr(FactTxt, 1, 250);
        CatFact.Insert();
    end;

    procedure RestShowStephenKingVillains()
    var
        RestClient: Codeunit "Rest Client";
        UrlSKLbl: Label 'https://stephen-king-api.onrender.com/api/villain/19';
    begin
        RestClient.Get(UrlSKLbl).GetContent().AsJson();
        Message(RestClient.Get(UrlSKLbl).GetContent().AsText());
    end;
}