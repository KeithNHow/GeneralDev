namespace KNHTest;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;

report 50600 KNH_Excel_MultiTable
{
    ApplicationArea = Basic, Suite;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Excel MultiTable';
    DefaultRenderingLayout = ExcelLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("No.");
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Balance; Balance)
            {
                IncludeCaption = true;
            }
            dataitem(CustLedgEntry; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");
                DataItemTableView = where("Document Type" = filter(Payment | Invoice | "Credit Memo"), Open = const(true));
                column(Document_Type; "Document Type")
                {
                }
                column(Document_Date; "Document Date")
                {
                }
                column(Original_Amount; "Original Amount")
                {
                }
                column(Remaining_Amount; "Remaining Amount")
                {
                }
                column(Customer_Posting_Group; "Customer Posting Group")
                {
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLinkReference = CustLedgEntry;
                    DataItemLink = "Customer No." = field("Customer No.");
                    column(Entry_Type; "Entry Type")
                    {
                    }
                    column(Posting_Date; "Posting Date")
                    {
                    }
                    column(Amount; Amount)
                    {
                    }
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    rendering
    {
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = '.\src\Report\KNHExcelMultiTable.xlsx';
        }
    }
}
