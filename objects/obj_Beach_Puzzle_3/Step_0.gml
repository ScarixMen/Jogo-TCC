script_execute(state)

if(!global.cam_override){
	script_execute(Input_Apollo)
}

if place_meeting(x,y,obj_Apollo) and interact_Apollo
{
	if (!draw_ok and !obj_Beach_Puzzle_4.draw_ok and obj_Beach_Puzzle_2.draw_ok){
		obj_Apollo.state = Apollo_State_Book
		draw_ok = true;
		
	}
}
if(btn_frame < 15 and draw_ok){
		btn_frame = (btn_frame + btn_speed) mod sprite_get_number(spr_Bookmark);
	}



