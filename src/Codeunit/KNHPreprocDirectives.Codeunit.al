///<Summary>
/// compiler directive - used to make code conditional.
/// region directive - used to define a block of code
/// pragma directive - Gives the compiler an instruction such as ignore warning message. 
///</Summary>

namespace KNHGenDev;
using Microsoft.Foundation.AuditCodes;

codeunit 50613 "KNH Preproc Directives"
{
    trigger OnRun()
    begin
        this.CompilerDirectiveExample();
        this.RegionDirectiveExample();
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
