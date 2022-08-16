/// <summary>
/// Codeunit "Letters" (ID 50003) contains func 'Capitalize' which inputs text string and outputs capitalized text string
/// </summary>
codeunit 50012 "KNH_Letters"
{
    Procedure Capitalize(inputstring: Text[250]) outputString: Text[250]
    begin
        outputString := UpperCase(inputString);
    end;
}
