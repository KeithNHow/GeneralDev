/// <summary>
/// Codeunit "Letters" (ID 50612) contains func 'Capitalize' which inputs text string and outputs capitalized text string
/// </summary>
codeunit 50612 "KNH Letters"
{
    Procedure Capitalize(inputstring: Text[250]) outputString: Text[250]
    begin
        outputString := UpperCase(inputString);
    end;
}
