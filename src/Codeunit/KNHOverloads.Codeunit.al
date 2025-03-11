// Codeunit "KNH_Overloads" (ID 50604) import text, date or integer, export text.

namespace KNHGenDev;
codeunit 50604 "KNH Overloads"
{
    trigger OnRun()
    var
        field1: Integer;
        field2: Integer;
        field3: Integer;
    begin
        field1 := 4;
        field2 := 5;
        field3 := 6;

        field3 := MyOverload(field1, field2);
        Message(Format(field3)); //Answer = 20
        field3 := MyOverload(field1);
        Message(Format(field3)); //Answer = 64
        field3 := MyOverload(field1, field2, field3);
        Message(Format(field3)); //Answer = 120
    end;

    var


    local procedure MyOverload(pfield1: Integer; pfield2: Integer): Integer
    begin
        exit(pfield1 * pfield2);
    end;

    local procedure MyOverload(pfield1: Integer): Integer
    begin
        exit(pfield1 * pfield1 * pfield1);
    end;

    local procedure MyOverload(pfield1: Integer; pfield2: Integer; pfield3: Integer): Integer
    begin
        exit(pfield1 * pfield2 * pfield3);
    end;

    /// <summary>
    /// ToString.
    /// </summary>
    /// <param name="value">Text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure MyString(value: Text): Text;
    begin
        exit(value);
    end;

    /// <summary>
    /// ToString.
    /// </summary>
    /// <param name="value">Date.</param>
    /// <returns>Return value of type Text.</returns>
    procedure MyString(value: Date): Text;
    begin
        exit(Format(value));
    end;

    /// <summary>
    /// ToString.
    /// </summary>
    /// <param name="value">Integer.</param>
    /// <returns>Return value of type Text.</returns>
    procedure MyString(value: Integer): Text;
    begin
        exit(Format(value));
    end;
}