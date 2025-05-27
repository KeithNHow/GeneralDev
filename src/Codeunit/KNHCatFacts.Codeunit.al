codeunit 50648 "KNH Cat Facts"
{
    //Show Cat fact using rest client
    procedure InsertCatFactUsingRest()
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
        CatFactTxt := CopyStr(RestClient.Get(UrlLbl).GetContent().AsText(), 1, 1024); // Get the text content from the REST API
        Counter := 0;
        StartPos := 1;
        if StrLen(CatFactTxt) <> 0 then
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
}