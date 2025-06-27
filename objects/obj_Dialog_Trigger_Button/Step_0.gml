if !start_dialog_done
{
    var dialog = instance_create_layer(x, y, "dialog", obj_Dialog);
    dialog.npc_name = "inicio" ; // ou qualquer outro nome do personagem
    start_dialog_done = true;
    global.dialog = true;
}

if !activated && place_meeting(x, y, obj_Player) && !global.dialog
{
    var dialog = instance_create_layer(x, y, "dialog", obj_Dialog);
    dialog.npc_name = "botao_tutorial";
    global.dialog = true;
    activated = true; // cria uma variável no Create
}