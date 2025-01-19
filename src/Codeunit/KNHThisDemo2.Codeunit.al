namespace KNHTest;
codeunit 50642 "KNH This Demo 2"
{
    procedure Demo2Procedure(KNHThisDemo1: Codeunit "KNH This Demo 1")
    begin
        KNHThisDemo1.Run();
    end;
}