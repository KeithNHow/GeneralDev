/// <summary>
/// Codeunit "Overloads" (ID 50004) import text, date or integer, export text.
/// </summary>
codeunit 50004 "KNH Overloads"
{
    trigger OnRun()
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
        field1: Integer;
        field2: Integer;
        field3: Integer;

    local procedure MyOverload(field1: Integer; field2: Integer): Integer
    begin
        exit(field1 * field2);
    end;

    local procedure MyOverload(field1: Integer): Integer
    begin
        exit(field1 * field1 * field1);
    end;

    local procedure MyOverload(field1: Integer; field2: Integer; field3: Integer): Integer
    begin
        exit(field1 * field2 * field3);
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