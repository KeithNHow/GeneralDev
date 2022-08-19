/// <summary>
/// Unknown "KNH_GenDev_Perms" (ID 50000).
/// </summary>
permissionset 50600 KNH_GenDev_Perms
{
    Assignable = true;
    Caption = 'KNH General Dev', MaxLength = 30;
    Permissions =
        codeunit "KNH Conditional Selection" = X,
        codeunit "KNH Case Selection" = X,
        codeunit "KNH Overloads" = X,
        codeunit "KNH Loop Variations" = X,
        codeunit "KNH List" = X,
        codeunit "KNH Dictionary" = X,
        codeunit "KNH System Functions" = X,
        codeunit "KNH Streaming" = X,
        codeunit "KNH Letters" = X,
        codeunit "KNH Variant Test" = X,
        codeunit "KNH Preprocessor Directives" = X;
}
