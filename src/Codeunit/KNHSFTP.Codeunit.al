namespace KNHGenDev;
using System.RestClient;

codeunit 50630 KNHSFTP
{
    trigger OnRun()
    begin
        this.RestClient.Create();

        this.ResponseText := this.RestClient.Get('https://www.needlecraftworld.co.uk').GetContent().AsText();

        this.RestClient.GetBaseAddress()
    end;

    var
        RestClient: Codeunit "Rest Client";
        //HttpResponseMessage: Codeunit "Http Response Message";
        ResponseText: Text;
}