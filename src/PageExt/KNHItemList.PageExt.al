namespace KNHGenDev;
using microsoft.Inventory.Item;

pageextension 50603 "KNH Item List" extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(KNH_ImportItemPicture)
            {
                ApplicationArea = Suite;
                ToolTip = 'Picture Import';
                Image = Import;
                Caption = 'Import Item Picture';

                trigger OnAction()
                var
                    KNHOnLineFileHandling: Codeunit "KNH Online File handling";
                begin
                    KNHOnLineFileHandling.ImportItemPicture();
                end;
            }
            action(KNH_ImportItem)
            {
                ApplicationArea = Suite;
                ToolTip = 'CSV Import';
                Image = Import;
                Caption = 'Import Item Record';

                trigger OnAction()
                var
                    KNHOnLineFileHandling: Codeunit "KNH Online File handling";
                begin
                    KNHOnLineFileHandling.UploadCSV();
                end;
            }
        }
        addlast(Promoted)
        {
            group(Import)
            {
                actionref(KNH_ImportItemPicture_Promoted; KNH_ImportItemPicture) { }
                actionref(KNH_ImportItemPromoted; KNH_ImportItem) { }
            }
        }
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
