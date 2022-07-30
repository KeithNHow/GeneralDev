/// <summary>
/// Codeunit "PreprocessorDirectives" (ID 50005)
/// preprocessor directives can be used to make code conditional
/// compiler directive - read only if debugger in use
/// region directive - used to define a block of code
/// 
/// </summary>
codeunit 50005 "KNH Preprocessor Directives"
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
