
event_inherited();

state = Luana_state_idle

pspd = 4

colision_box = false

damage_Luana = function(){

	state  = Luana_State_Death
	
	global.damage = true

}