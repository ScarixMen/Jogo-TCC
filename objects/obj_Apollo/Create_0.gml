event_inherited();

crounch = 0
cspd = 3
state = Apollo_State_Idle

damage_Apollo = function(){

	state  = Apollo_State_Death
	
	global.damage = true

}