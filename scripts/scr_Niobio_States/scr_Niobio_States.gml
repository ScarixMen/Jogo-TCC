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
			global.som.tocarSFX(sfx_Niobio_Fall)
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
		
	}
}

function Niobio_State_View_Puzzle(){
	
	sprite_index = spr_Niobio_Idle
	
	global.cam_override = true
	global.focus_target = obj_Apollo
		
    timer--;
	
    if (timer <= 0) {
		
		obj_Apollo.state = Apollo_State_Idle
		state = Niobio_State_Run
	}
	
}

function Niobio_State_Run(){
	
	sprite_index = spr_Niobio_Run
	
	//hspd = move * spd;
	
}

function Niobio_State_Reset(){
	
	sprite_index = spr_Niobio_Reset
	
	image_xscale = -1
	
	if(image_index >= image_number -1 )
	{
		
		state = Niobio_State_Statue
		
	}
		
}

function Niobio_State_Push() {
	Input_Luana();
    sprite_index = spr_Niobio_Run; // precisa de sprite específico, se não tiver pode usar spr_Niobio_Run
   // Quando a Luana pressiona
	if (interact_Luana) {
	    timer2 = 5; // congela por 10 frames (~0,16s a 60fps)
	}

	// Se está congelado
	if (timer2 > 0) {
	    timer2--;
	    sprite_index = spr_Niobio_Pushed; // trava animação
	} else {
		sprite_index = spr_Niobio_Run
	    image_speed = 1;
	}

}
function Niobio_State_Cutscene() {

}
function Niobio_State_Jump_A() {
	
	sprite_index = spr_Niobio_Jump
	
	if(image_index >= image_number -1 )
	{
		
		vspd = jspd
		
		move = 1
	
		hspd = move * spd;
		
	}

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if (vspd<=0)
	{	
		state = Niobio_State_Air_A
	}
}


function Niobio_State_Air_A() {
		if(image_index >= image_number -1)
		{
			sprite_index = spr_Niobio_Air
		}
		
	
    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
		if place_meeting(x, y + 1, obj_Base_Niobio)
		{
			image_index = 0
			global.som.tocarSFX(sfx_Niobio_Fall)
			state = Niobio_State_Falling_A
		}
		
}
		
function Niobio_State_Falling_A() {
	
	hspd = 0
	sprite_index = spr_Niobio_Falling
	if(image_index >= image_number -1)
	{ 
		image_index = 0
		state = Niobio_State_Idle_Dialog_2
		
	}	
}

