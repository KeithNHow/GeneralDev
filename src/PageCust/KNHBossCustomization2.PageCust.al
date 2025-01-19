/// <summary>
/// PageCust "KNH_BossCustomization2".
/// </summary>

namespace KNHTest;
using Microsoft.Sales.Customer;

pagecustomization "KNH Boss Customization 2" customizes "Customer Card"
{
    layout
    {
        modify(Name)
        {
            Visible = false;
        }
    }
}