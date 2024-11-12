/// <summary>
/// PermissionSet KNH Gen Dev PermSet (ID 50601).
/// </summary>
permissionset 50601 "KNH Gen Dev PermSet"
{
    Assignable = true;
    Caption = 'Gen Dev PermSet', MaxLength = 30;
    Permissions = table "KNH Source Line" = X,
        tabledata "KNH Source Line" = RMID,
        table "KNH Source" = X,
        tabledata "KNH Source" = RMID,
        table "KNH Note" = X,
        tabledata "KNH Note" = RMID,
        table "KNH Error Log" = X,
        tabledata "KNH Error Log" = RMID,
        table "KNH Blob" = X,
        tabledata "KNH Blob" = RMID,
        codeunit "KNH Conditional Selection" = X,
        codeunit "KNH Convert Blob" = X,
        codeunit "KNH Dictionary" = X,
        codeunit "KNH Letters" = X,
        codeunit "KNH Variant Test" = X,
        codeunit "KNH Transfer Fields" = X,
        codeunit "KNH Table Filters" = X,
        codeunit "KNH Streaming" = X,
        codeunit "KNH Rename" = X,
        codeunit "KNH RecordRef" = X,
        codeunit "KNH Preproc Directives" = X,
        codeunit "KNH Overloads" = X,
        codeunit "KNH Selection" = X,
        codeunit "KNH System Functions" = X,
        codeunit "KNH List" = X,
        page "KNH Sources" = X,
        page "KNH Source Lines" = X,
        page "KNH Notes" = X,
        report KNH_Excel_MultiTable = X,
        codeunit "KNH Change Company" = X,
        codeunit "KNH Error Log" = X,
        codeunit "KNH Marked Customers" = X,
        codeunit "KNH Use Standard Error" = X,
        xmlport "KNH Source" = X,
        page "KNH Error Log" = X,
        codeunit "KNH Copy Test" = X,
        codeunit "KNH Data Transfer" = X,
        codeunit "KNH Error Handling" = X,
        codeunit "KNH Field Transfer" = X,
        codeunit "KNH Loop Variations" = X,
        codeunit "KNH Send Email" = X,
        codeunit "KNH Schedule Reports" = X;
}