namespace KNHGenDev;
using System.Integration;

page 50607 "KNH Control Host AddIn"
{
    PageType = UserControlHost;
    ApplicationArea = All;
    UsageCategory = Administration;
    AboutText = 'This is a demo page for a Controlhost AddIn';
    AboutTitle = 'Controlhost AddIn Demo';
    AdditionalSearchTerms = 'Controlhost, AddIn, Demo';
    Caption = 'Keith''s Playground';
    Editable = false;

    layout
    {
        area(Content)
        {
            usercontrol(KNHTestPage; WebPageViewer)
            {
                trigger ControlAddInReady(CallbackUrl: Text)
                begin
                    CurrPage.KNHTestPage.Navigate(this.HyperLinkTxt);
                end;

                trigger Refresh(CallbackUrl: Text)
                begin
                    CurrPage.KNHTestPage.Navigate(this.HyperLinkTxt);
                end;
            }
        }
    }

    var
        HyperLinkTxt: Label 'https://needlecraftworld.co.uk', locked = true;
}