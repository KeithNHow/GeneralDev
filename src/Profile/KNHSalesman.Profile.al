/// <summary>
/// The profile object allows you to build an individual experience for each user account. The Profile object performs a validation to check to see whether the specified role center page exists, and whether page customization objects exist. On a page customization you can add changes to the page layout, and actions.
/// </summary>
namespace KNHGenDev;
using Microsoft.Sales.RoleCenters;

profile "KNH Salesman"
{
    Caption = 'Salesman';
    ProfileDescription = 'The Salesman';
    RoleCenter = "Sales Manager Role Center";
}