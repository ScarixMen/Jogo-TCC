function Ravi_Things_triggered(){
	
	if(!global.cam_override)script_execute(Input_Luana)
	if(!global.cam_override)script_execute(Input_Apollo)
	
	if(place_meeting(x,y,obj_Player) && obj_Dialog_Trigger_Ravi.duo_ready){
	
		if(interact_Apollo or interact_Luana)
		{
			
			state = Ravi_Things_Active
			
		}
	}
}
function Ravi_Things_Active(){

	var dialog = instance_create_layer(x, y, layer, obj_Dialog);
    dialog.npc_name = "Things_Of_Ravi";
    global.dialog = true;
	
	state = Ravi_Things_Deactive;

}
function Ravi_Things_Deactive(){
	exit;
}
