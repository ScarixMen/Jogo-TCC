function Anhanga_State_Attack_Spear_Middle(){

	instance_create_layer(center_x ,center_y - 300, layer, obj_Spear);
	select_plat = "middle"
	state = Anhanga_State_Waiting

}

function Anhanga_State_Attack_Spear_1(){
	
	instance_create_layer(center_x + 400,center_y - 500, layer, obj_Spear);
	instance_create_layer(center_x - 400, center_y - 500, layer, obj_Spear);
	select_plat = "1"
	state = Anhanga_State_Waiting

}

function Anhanga_State_Attack_Spear_2(){
	
	 instance_create_layer(center_x - 760, center_y - 600, layer, obj_Spear);
	 instance_create_layer(center_x + 760, center_y - 600, layer, obj_Spear);
	 select_plat = "2"
	 state = Anhanga_State_Waiting

}

function Anhanga_State_Attack_Spear_3(){
	
	 instance_create_layer(center_x - 1030, center_y - 700, layer, obj_Spear);
	 instance_create_layer(center_x + 1030, center_y - 700, layer, obj_Spear);
	 select_plat = "3"
	 state = Anhanga_State_Waiting

}
function Anhanga_State_Attack_Spear_4(){
	
	 instance_create_layer(center_x - 560, center_y - 800, layer, obj_Spear);
	 instance_create_layer(center_x + 560, center_y - 800, layer, obj_Spear);
	 select_plat = "4"
	 state = Anhanga_State_Waiting

}

function Anhanga_State_Waiting(){
	timer++;
	
	if (timer >= timer_delay)
	{
		
		switch select_plat
		{
			case "middle":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_1
			
			break;
			
			case "1":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_2
			
			break;
			
			case "2":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_3
			
			break;
			
			case "3":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_4
			
			break;
			
			case "4":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_Middle
			
			break;
			
		}
		
	}
}