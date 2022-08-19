/// <summary>
/// PageExtension NEU Sales Order (ID 50600) extends Record Sales Order.
/// </summary>
pageextension 50600 "KNH Sales Order" extends "Sales Order"
{
    actions
    {
        addfirst(Processing)
        {
            action(ShowJson)
            {
                Caption = 'Show Json';
                Tooltip = 'Show Json';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = Basic, Suite;
                Image = Document;

                trigger OnAction()
                var
                    Obj: JsonObject;
                    O2: JsonObject;
                    Item: JsonObject;
                    Token1: JsonToken;
                    Token2: JsonToken;
                    Token3: JsonToken;
                    Ja: JsonArray;
                    V: JsonValue;
                begin
                    Obj.Add('field', 'You tube video'); //add field to object
                    V.SetValue(133.456);
                    Obj.Add('Price', V);
                    Item.Add('No', 20220224D);
                    Ja.Add(Item); //Add object to Array
                    Clear(Item); //Clear object
                    Item.Add('No', 20220226D);
                    Ja.Add(Item);
                    Ja.Add(100); //Add field to array
                    Ja.Add(200);
                    Obj.Add('Version', '0/2.0'); //Add field to object
                    Obj.Add('Items', Ja); //Add array to object

                    if Obj.Contains('Items') then begin //search obj for array
                        Obj.Get('Item', Token1); //Token becomes an object
                        foreach Token2 in Token1.AsArray() do begin //Find each field in object    
                            O2 := Token2.AsObject(); //Place field in second object
                            O2.Get('No', Token3); //Token becomes an object value
                            if Token3.IsValue() then begin
                                V := Token3.AsValue();
                                Message('Value as Date %1', CalcDate('<+5D>', V.AsDate()));
                            end;
                        end;
                        //Obj.WriteTo(txt);
                        //Message(txt);
                    end;
                end;
            }
        }
    }
}
