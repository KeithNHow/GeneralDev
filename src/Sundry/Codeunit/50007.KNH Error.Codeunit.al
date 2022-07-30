/// <summary>
/// Codeunit KNH Error (ID 50007).
/// </summary>
codeunit 50007 "KNH Error"
{
    trigger OnRun()
    begin
        Error('My codeunit does not work.');
    end;
}
