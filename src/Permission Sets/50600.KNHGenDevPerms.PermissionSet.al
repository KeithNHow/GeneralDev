/// <summary>
/// Unknown "KNH_GenDev_Perms" (ID 50000).
/// </summary>
permissionset 50600 KNH_GenDev_Perms
{
    Assignable = true;
    Caption = 'KNH General Dev', MaxLength = 30;
    Permissions =
        codeunit "KNH Variant Test" = X,
        codeunit "KNH Copy Test" = X,
        codeunit "KNH Conditional Selection" = X,
        codeunit "KNH Case Selection" = X,
        codeunit "KNH Overloads" = X,
        codeunit "KNH Loop Variations" = X,
        codeunit "KNH List" = X,
        codeunit "KNH Dictionary" = X,
        codeunit "KNH TransferFields" = X,
        codeunit "KNH System Functions" = X,
        codeunit "KNH Streaming" = X,
        codeunit "KNH RecordRef" = X,
        codeunit "KNH Letters" = X,
        codeunit "KNH Preprocessor Directives" = X,
        Table "KNH Note" = X,
        TableData "KNH Note" = RIMD,
        Page "KNH Notes" = X;
}
