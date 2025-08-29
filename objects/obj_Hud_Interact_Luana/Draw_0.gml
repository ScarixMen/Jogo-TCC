if (Check_Pause()) exit;
if global.gamepad_id == 0 
{

	draw_sprite(spr_Interact_Button_X, floor(btn_frame), x, y);
	
}else {
	
	draw_sprite(spr_Interact_Button_Shift, floor(btn_frame), x, y);
	
}

