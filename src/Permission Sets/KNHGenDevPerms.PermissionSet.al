/// <summary>
/// Unknown "KNH_GenDev_Perms" (ID 50000).
/// </summary>
permissionset 50000 KNH_GenDev_Perms
{
    Assignable = true;
    Caption = 'KNH General Dev', MaxLength = 30;
    Permissions =
        codeunit KNH_Conditional_Selection = X,
        codeunit KNH_Case_Selectuion = X,
        codeunit KNH_Overloads = X,
        codeunit KNH_Loop_Variations = X,
        codeunit KNH_List = X,
        codeunit KNH_Dictionary = X,
        codeunit KNH_System_Functions = X,
        codeunit KNH_Streaming = X,
        codeunit KNH_Letters = X,
        codeunit KNH_Variant_Test = X,
        codeunit KNH_Preprocessor_Directives = X;
}
