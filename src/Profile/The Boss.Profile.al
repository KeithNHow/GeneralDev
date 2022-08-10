/// <summary>
/// Profile "The Boss"
/// </summary>
Profile "The Boss"
{
    Description = '';
    Caption = 'The Boss';
    ProfileDescription = 'Changes to make this role center more suitable for the boss.';
    RoleCenter = "Business Manager Role Center";
    Promoted = true;
    Customizations = BossCustomizations;
}

pagecustomization BossCustomizations customizes "Customer List"
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

pagecustomization AccountManager customizes "Customer Card"
{
    layout
    {
        modify(Name)
        {
            Visible = false;
        }
    }
}
