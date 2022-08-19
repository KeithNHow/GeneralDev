/// <summary>
/// Codeunit "PreprocessorDirectives" (ID 50613)
/// preprocessor directives can be used to make code conditional
/// compiler directive - read only if debugger in use
/// region directive - used to define a block of code
/// 
/// </summary>
codeunit 50613 "KNH Preprocessor Directives"
{
    #region mycode

#if DEBUG
    trigger OnOpenPage()
    begin
        Message('Only in debug versions');
    end;
#endif

    #endregion

}
