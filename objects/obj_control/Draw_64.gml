var _x = display_get_gui_width() - 60
var _y = display_get_gui_height() - 60

if(global.save)
{
	timer--;
	draw_sprite(spr_Save,frame,_x,_y)
	if(timer <= 0)
	{
		timer = 90
		global.save = false;
		
	}
}