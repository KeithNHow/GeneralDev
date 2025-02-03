namespace KNHGenDev;

codeunit 50640 "KNH Boolean Coditional"
{
    procedure Example()
    var
        MyExpression: Boolean;
        MyVar: Text;
    begin
        if MyExpression then
            MyVar := 'true'
        else
            MyVar := 'false';

        //MyVar := MyExpression ? 'True': 'False';

        MyVar := Format(MyExpression);
    end;
}