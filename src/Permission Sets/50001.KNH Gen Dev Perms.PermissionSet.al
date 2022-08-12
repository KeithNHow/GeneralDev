/// <summary>
/// Unknown KNH Gen Dev Perms (ID 50001).
/// </summary>
permissionset 50001 "KNH Gen Dev Perms"
{
    Assignable = true;
    Caption = 'General Dev Permission Set', MaxLength = 30;
    Permissions =
        codeunit "KNH Variant Test" = X,
        codeunit "KNH Streaming" = X,
        codeunit "KNH Letters" = X,
        codeunit "KNH Preprocessor Directives" = X,
        codeunit "KNH Conditional Selection" = X,
        codeunit "KNH Overloads" = X,
        codeunit "KNH Dictionary" = X,
        codeunit "KNH List" = X,
        codeunit "KNH Case Selectuion" = X,
        codeunit "KNH Loop Variations" = X,
        codeunit "KNH System Functions" = X;
}
