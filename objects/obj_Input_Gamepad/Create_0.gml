global.gamepad_id = noone;

gamepad_conect = function ()
{
	
	var _gamepad_slots = gamepad_get_device_count();
	
	for(var _i = 0; _i  < _gamepad_slots; _i++){
		
		if(gamepad_is_connected(_i))
		{
			
			global.gamepad_id = _i
			gamepad_set_axis_deadzone(global.gamepad_id, 0.25)
			return true;
		
		}
	}
	
	return false;
	
}