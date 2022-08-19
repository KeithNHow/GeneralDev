/// <summary>
/// Codeunit KNH My Selectuion (ID 50603).
/// </summary>
codeunit 50603 "KNH Case Selection"
{
    var
        I: Integer;
        J: Integer;
        WhoAmI: Code[20];

    trigger OnRun()
    begin
        //Case selection
        WhoAmI := 'Mark';
        case WhoAmI of
            'Keith':
                begin
                    I := 10;
                    J := 20;
                    message('Keith your score is ' + format(I * J));
                end;
            'Mark':
                begin
                    I := 5;
                    J := 4;
                    message('Mark your score is ' + format(I * J));
                end;
            'Paul':
                begin
                    I := 30;
                    J := 50;
                    message('Paul your score is ' + format(I * J));
                end;
            else
                Message('Case has failed, no name found.');
        end;
    end;
}
