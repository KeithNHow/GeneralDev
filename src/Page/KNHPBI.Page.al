namespace KNHGenDev;
using System.Integration.PowerBI;

page 50608 "KNH PBI"
{
    PageType = UserControlHost;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Power BI Balance Sheet';

    layout
    {
        area(Content)
        {

            usercontrol(PowerBIManagement; PowerBIManagement)
            {
                ApplicationArea = All;

                trigger ControlAddInReady()
                begin
                    this.InitializeAddIn();
                end;
            }
        }
    }


    local procedure InitializeAddIn()
    var
        PowerBIServiceMgt: Codeunit "Power BI Service Mgt.";
    begin
        CurrPage.PowerBIManagement.SetPage('KNH PBI');
        CurrPage.PowerBIManagement.Setlocale('en-gb');
        PowerBIServiceMgt.InitializeAddInToken(CurrPage.PowerBIManagement);

        CurrPage.PowerBIManagement.EmbedPowerBIReport(
            'https://app.powerbi.com/reportEmbed?reportid=3f6c3d1a-2ddc-4fa7-b976-f0c9e4c609ae',
            '6b3b2ffa-9946-4c80-a0a3-478002a833ca',
            'aabff1700d3552993d95');

        CurrPage.Update();
    end;
}