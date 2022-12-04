/// <summary>
/// CodeunitO "TableFilters" (ID 50614).
/// </summary>
codeunit 50615 "KNH Table Filters"
{
    var
        SalesHeader: Record "Sales Header";
        Name: Text;
        Counter: Integer;
        CountMsg: Label 'Records counted = %1', Comment = '%1 = Counter';

    trigger OnRun()
    begin
        #region [my region]
        Name := 'Teddy';
        Salesheader.Reset();
        SalesHeader.SetCurrentKey("Document Type", "No.");
        SalesHeader.SetFilter("Document Type", '%1|%2', 2, 3);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        SalesHeader.SetFilter("Sell-to Customer Name", '@' + Name + '*');
        if SalesHeader.FindSet() then begin
            repeat
                Counter += 1;
            until SalesHeader.Next() = 0;
            Message(CountMsg, Counter);
        end;
        #endregion
    end;
}
