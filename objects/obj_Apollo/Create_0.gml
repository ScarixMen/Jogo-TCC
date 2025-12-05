event_inherited();

global.interact_apollo = false;


timer = 120

crounch = 0
cspd = 3
state = Apollo_State_Idle

damage_Apollo = function(){

	state  = Apollo_State_Death
	
	global.damage = true

}

damage_Apollo_Boca = function(){

	state  = Apollo_State_Death_Boca
	
	global.damage = true

}

damage_Apollo_Forest = function(){

	state  = Apollo_State_Death_Forest
	
	global.damage = true

}

damage_Apollo_Forest_Anhanga = function(){

	state  = Apollo_State_Death_Forest_Anhanga
	
	global.damage = true

}