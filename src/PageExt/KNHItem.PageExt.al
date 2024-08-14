pageextension 50603 "KNH Item" extends "Item List"
{
    layout
    {


    }

    actions
    {
        // Add changes to page actions here
    }

    views
    {
        addfirst
        {
            view(Search1)
            {
                Caption = 'Search Description 1';
                Filters = where("Search Description" = filter('E*'));
                OrderBy = ascending("Search Description");
                SharedLayout = false;

                layout
                {

                }
            }
            view(Search2)
            {
                Caption = 'Search Description 2';
                Filters = where("Search Description" = filter('A*'));
                OrderBy = ascending("Search Description");
                SharedLayout = false;

                layout
                {
                    movefirst(Control1; "Unit Price")

                    modify(Control1)
                    {
                        FreezeColumn = "Unit Price";
                    }
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("Search Description");
    end;
}
