function Niobio_State_Statue(){
	
	image_index = 0
	sprite_index = spr_Niobio_Statue
	
	
}

function Niobio_State_Uncross(){
	
	sprite_index = spr_Niobio_Uncross
	
	if(image_index >= image_number -1 )
	{
		
		state = Niobio_State_Idle_Dialog_1
		
	}
	
}

function Niobio_State_Idle_Dialog_1(){
	
	sprite_index = spr_Niobio_Idle
	
	if(image_index >= image_number -1 )
	{
		
		var dialog = instance_create_layer(x, y, "dialog", obj_Dialog);
	    dialog.npc_name = "Niobio_Idle_1";
	    global.dialog = true;
	    activated_box = true; // cria uma variável no Create
		
	}
	
	
}

function Niobio_State_Jump() {
	
	sprite_index = spr_Niobio_Jump
	
	if(image_index >= image_number -1 )
	{
		
		vspd = jspd
		
		move = -1
	
		hspd = move * spd;
		
	}

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if (vspd<=0)
	{	
		state = Niobio_State_Air
	}
}

	function Niobio_State_Air() {
		if(image_index >= image_number -1)
		{
			sprite_index = spr_Niobio_Air
		}
		
	
    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
		if place_meeting(x, y + 1, obj_Block)
		{
			image_index = 0
			state = Niobio_State_Falling
		}
		
}

		
function Niobio_State_Falling() {
	
	hspd = 0
	sprite_index = spr_Niobio_Falling
	if(image_index >= image_number -1)
	{ 
		image_index = 0
		state = Niobio_State_Idle_Dialog_2
		
	}	
}

function Niobio_State_Idle_Dialog_2(){
	
	sprite_index = spr_Niobio_Idle
	
	if(image_index >= image_number -1 )
	{
		
		var dialog = instance_create_layer(x, y, "dialog", obj_Dialog);
	    dialog.npc_name = "Niobio_Idle_2";
	    global.dialog = true;
	    activated_box = true; 
		
	}
}

function Niobio_State_Run(){
	
	sprite_index = spr_Niobio_Run
	
	hspd = move * spd;
	
}

function Niobio_State_Reset(){
	
	sprite_index = spr_Niobio_Reset
		
}