/// <summary>
/// Codeunit "KNH PreprocessorDirectives" (ID 50613)
/// preprocessor directives can be used to make code conditional
/// compiler directive - read only if debugger in use
/// region directive - used to define a block of code
/// pragma directive - gives the compiler special inst for the compile of the file in which it appears. 
/// </summary>

namespace KNHGenDev;
using Microsoft.Foundation.AuditCodes;

codeunit 50613 "KNH Preproc Directives"
{
    trigger OnRun()
    begin
        this.CompilerDirectiveExample();
        RegionDirectiveExample();
        if this.SourceCode.FindFirst() then
            this.PragmaDirectiveExample(SourceCode);
    end;

    var
        SourceCode: Record "Source Code";

    local procedure CompilerDirectiveExample()
    begin
#if Debug //Compiler directive
        Message('Only seen in debug versions');
#endif
    end;

    local procedure RegionDirectiveExample()
    begin
        #region - Region directive
        Message('My Block of Code');
        #endregion
    end;

#pragma warning disable AA0244
    local procedure PragmaDirectiveExample(SourceCode: Record "Source Code")
    var
        Description: Text[100];
    begin
        Description := SourceCode.Description;
        Message('Hello World?');
    end;
#pragma warning restore AA0244
}
