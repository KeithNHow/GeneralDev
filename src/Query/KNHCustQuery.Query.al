query 50600 "KNH Cust Query"
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            DataItemTableFilter = "Currency Code" = filter('');
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
                ColumnFilter = Name = filter('A*');
            }
            column(SalesLCY; "Sales (LCY)")
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }
            column(County; County)
            {
            }
            dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
            {
                DataItemLink = Code = Customer."Salesperson Code";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = Name = filter('>=A*<M*');
                column(SalespersonName; Name)
                {
                }
                column(E_Mail; "E-Mail")
                {
                }
                column(Phone_No_; "Phone No.")
                {
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}