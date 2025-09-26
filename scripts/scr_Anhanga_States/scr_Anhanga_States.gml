function Anhanga_State_Attack_Spear_Left(){

	
	 instance_create_layer(524, y+100, layer, obj_Spear);
	 select_plat = "middle"
	 state = Anhanga_State_Waiting

}
function Anhanga_State_Attack_Spear_Middle(){

	 instance_create_layer(960, y+100, layer, obj_Spear);
	 select_plat = "right"
	 state = Anhanga_State_Waiting

}
function Anhanga_State_Attack_Spear_Right(){

	 instance_create_layer(1384, y+100, layer, obj_Spear);
	 select_plat = "left"
	 state = Anhanga_State_Waiting

}
function Anhanga_State_Waiting(){
	timer++;
	
	if (timer >= timer_delay)
	{
		
		switch select_plat
		{
			case "left":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_Left
			
			break;
			
			case "middle":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_Middle
			
			break;
			
			case "right":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_Right
			
			break;
			
		}
		
	}
	
}