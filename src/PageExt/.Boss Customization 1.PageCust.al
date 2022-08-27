/// <summary>
/// Unknown "BossCustomization1".
/// </summary>
pagecustomization "Boss Customization 1" customizes "Customer List"
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