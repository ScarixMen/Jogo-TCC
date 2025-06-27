if !activated_box && place_meeting(x, y, obj_Box)&& !global.cam_override &&  !global.dialog
{
    var dialog = instance_create_layer(x, y, "dialog", obj_Dialog);
    dialog.npc_name = "caixa";
    global.dialog = true;
    activated_box = true; // cria uma variável no Create
}