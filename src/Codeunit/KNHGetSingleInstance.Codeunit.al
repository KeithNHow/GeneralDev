///<Summary>
///This codeunit runs the Get Single Instance function in the Set Single Instance codeunit. The function updates a variable that is returned to this function and the content of the variable is then displayed. If the Set Single Instance function has not already been run no message will be displyed. The SetSingleInstance property ensures the variable value is not lost on exit of the Set Single Instance codeunit. 
///</Summary>
namespace KNHGenDev;

codeunit 50637 "KNH Get Single Instance"
{
    trigger OnRun()
    var
        KNHSetSingleInstance: Codeunit "KNH Set Single Instance";
        TheText: Text[100];
    begin
        TheText := KNHSetSingleInstance.GetSingleInstance();
        Message(TheText);
    end;
}