/// <summary>
/// Codeunit "KNH_Selection" (ID 50603).
/// </summary>

namespace KNHGenDev;

codeunit 50603 "KNH Selection"
{
    trigger OnRun()
    var
        I: Integer;
        J: Integer;
        WhoAmI: Text;
    begin
        //Case selection
        WhoAmI := 'Mark';
        case WhoAmI of
            'Keith':
                begin
                    I := 10;
                    J := 20;
                    Message('Keith your score is ' + Format(I * J));
                end;
            'Mark':
                begin
                    I := 5;
                    J := 4;
                    Message('Mark your score is ' + Format(I * J));
                end;
            'Paul':
                begin
                    I := 30;
                    J := 50;
                    Message('Paul your score is ' + Format(I * J));
                end;
            else
                Message('Case has failed, no name found.');
        end;
    end;
}
