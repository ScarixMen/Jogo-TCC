if !activated && place_meeting(x, y, obj_Player) && !global.dialog
{
    var dialog = instance_create_layer(x, y, "dialog", obj_Dialog);
    dialog.npc_name = "botao_plataforma";
    global.dialog = true;
    activated = true; // cria uma variável no Create
}
