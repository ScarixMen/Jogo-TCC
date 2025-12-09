if !activated_box && !global.cam_override &&  !global.dialog
{
	
    var dialog = instance_create_layer(x, y, layer, obj_Dialog);
    dialog.npc_name = "temple";
    global.dialog = true;
    activated_box = true;
	
}
if !activated_box_2 && place_meeting(x, y, obj_Player)&& !global.cam_override &&  !global.dialog
{
	if(instance_exists(obj_Passage) or instance_exists(obj_Passage_2))
	
    var dialog = instance_create_layer(x, y, layer, obj_Dialog);
    dialog.npc_name = "temple_help";
    global.dialog = true;
    activated_box_2 = true; 
	
}
