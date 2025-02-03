// Codeunit "KNH Letters" (ID 50612) contains func 'Capitalize' which inputs text string and outputs capitalized text string

namespace KNHGenDev;
codeunit 50612 "KNH Letters"
{
    /// <summary>
    /// Capitalize.
    /// </summary>
    /// <param name="inputstring">Text[250].</param>
    /// <returns>Return variable outputString of type Text[250].</returns>

    procedure Capitalize(inputstring: Text[250]) outputString: Text[250]
    begin
        outputString := UpperCase(inputstring);
    end;
}
