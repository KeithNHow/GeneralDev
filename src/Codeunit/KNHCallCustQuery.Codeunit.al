namespace KNHGenDev;
using KNHCustQuery;

codeunit 50649 "KNH Call Cust Query"
{
    trigger OnRun()
    begin
        this.UseCustomerOverviewQuery();
    end;

    procedure UseCustomerOverViewQuery()
    var
        KNHCustQuery: Query "KNH Cust Query";
        A: Integer;
        B: Integer;
        C: Integer;
    begin
        A := 0;
        B := 0;
        C := 0;
        if not KNHCustQuery.Open() then
            exit
        else
            while KNHCustQuery.Read() do begin
                A += 1;
                B += 1;
                C := A * B;
            end;
        Message(Format(C));
    end;
}