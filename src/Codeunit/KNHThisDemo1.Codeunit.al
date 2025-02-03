//This Keyword - Allow codeunits to pass a reference to this as an argument to another method.
//This Keyword - Improve readability by signaling that a referenced symbol is a member on the object itself.

namespace KNHGenDev;
codeunit 50641 "KNH This Demo 1"
{
    trigger OnRun()
    var
        KNHThisDemo2: Codeunit "KNH This Demo 2";
    begin
        this.MyInt := 10;
        this.MyVar := 'is awesome';
        this.IsNice();
        KNHThisDemo2.Demo2Procedure(this);
    end;

    local procedure IsNice()
    begin
        Message('This codeunit ' + this.MyVar + Format(this.MyInt));
    end;

    var
        MyInt: Integer;
        MyVar: Text;
}