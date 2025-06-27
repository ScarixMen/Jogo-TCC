if !activated && place_meeting(x, y, obj_Box) && obj_Button_Blue.state == Button_Blue_Pressed && !global.dialog
{
    var dialog = instance_create_layer(x, y, "dialog", obj_Dialog);
    dialog.npc_name = "final_tutorial";
    global.dialog = true;
    activated = true; // cria uma variável no Create
}
