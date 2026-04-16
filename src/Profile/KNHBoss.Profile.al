/// <summary>
/// The profile object allows you to build an individual experience for one or more users. The Profile object performs a validation to check to see whether the specified role center page exists, and whether page customization objects exist. On a page customization you can customize multiple pages, their layouts, and actions.
/// </summary>
namespace KNHGenDev;
using Microsoft.Finance.RoleCenters;

profile "KNH Boss"
{
    Caption = 'The Boss';
    Customizations = "KNH Boss Customization 1", "KNH Boss Customization 2";
    ProfileDescription = 'Changes to make this role center more suitable for the boss.';
    Promoted = true;
    RoleCenter = "Business Manager Role Center";
}
