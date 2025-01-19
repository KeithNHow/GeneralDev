/// <summary>
/// Profile "KNH_TheBoss"
/// The profile object in Dynamics 365 BC allows you to build an individual experience for each user profile. The Profile object performs a validation to check whether the specified role center page exists, and page customization objects exists, when you define a new profile object. On a page customization you can add changes to the page layout, and actions.
/// </summary>

namespace KNHTest;
using Microsoft.Finance.RoleCenters;

profile "KNH_The Boss"
{
    Description = '';
    Caption = 'The Boss';
    ProfileDescription = 'Changes to make this role center more suitable for the boss.';
    RoleCenter = "Business Manager Role Center";
    Promoted = true;
    Customizations = "KNH Boss Customization 1", "KNH Boss Customization 2";
}
