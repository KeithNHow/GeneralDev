/// <summary>
/// Profile "TheBoss"
/// </summary>
Profile TheBoss
{
    Description = '';
    Caption = 'The Boss';
    ProfileDescription = 'Changes to make this role center more suitable for the boss.';
    RoleCenter = "Business Manager Role Center";
    Promoted = true;
    Customizations = BossCustomization1, BossCustomization2;
}

pagecustomization BossCustomization1 customizes "Customer List"
{
    layout
    {
        modify(Name)
        {
            Visible = false;
        }
    }

    actions
    {
        //Blanket Orders is moved after the Orders action item
        moveafter(Orders; "Blanket Orders")

        //The modify method is used to hide the NewSalesBlanketOrder action item.
        modify(NewSalesBlanketOrder)
        {
            Visible = false;
        }
    }
}

pagecustomization BossCustomization2 customizes "Customer Card"
{
    layout
    {
        modify(Name)
        {
            Visible = false;
        }
    }
}
