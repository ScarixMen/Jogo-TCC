function Input_Player(){
	
	pause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(global.gamepad_id,gp_start)
	global.skip = keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(global.gamepad_id,gp_face1)
	
}

function Input_Luana(){
	
	#region	Block Input
	if global.cam_override
	{
		state = Luana_State_Cutscene
		exit;
	
	}
	if (global.dialog && obj_Luana.can_control)
	{
	    if(global.damage)
	    {
	        state = Luana_State_Death;
	        exit;
	    }
	    state = Luana_State_Idle;
	    exit;
	}
#endregion

	left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25 or keyboard_check(vk_left) or gamepad_button_check(global.gamepad_id,gp_padl)
	right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25 or keyboard_check(vk_right) or gamepad_button_check(global.gamepad_id,gp_padr)
	move = -left+right
	
	interact_Luana = gamepad_button_check_pressed(global.gamepad_id,gp_face3) or keyboard_check_pressed(ord("P"))
	
	jump = !global.skip and (gamepad_button_check_pressed(global.gamepad_id, gp_face1) or keyboard_check_pressed(vk_up));

	pause = gamepad_button_check_pressed(global.gamepad_id,gp_face1)
	
}

function Input_Apollo(){
	
	#region	Block Input
	if global.cam_override
	{
		state = Apollo_State_Cutscene
		exit;
	
	}
	if (global.dialog && obj_Apollo.can_control)
	{
	    if(global.damage)
	    {
	        state = Apollo_State_Death;
	        exit;
	    }
	    state = Apollo_State_Idle;
	    exit;
	}
	
	#endregion

	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	move = -left+right
	
	interact_Apollo = keyboard_check_pressed(ord("E"))
	
	jump = keyboard_check_pressed(vk_space)
	
	crounch = keyboard_check(vk_control)
	
	

}

function Input_Menu(){
	
// No step:
var limiar = 0.5;
var eixo_valor = gamepad_axis_value(global.gamepad_id, gp_axislv);

var axis_up_now = (eixo_valor < -limiar);
var axis_up_pressed = (axis_up_now == true) and (axis_up_previously == false);
axis_up_previously = axis_up_now;

var axis_down_now = (eixo_valor > limiar);
var axis_down_pressed = (axis_down_now == true) and (axis_down_previously == false);
axis_down_previously = axis_down_now;


pause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(global.gamepad_id,gp_start)

up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(global.gamepad_id, gp_padu) or axis_up_pressed;
down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or gamepad_button_check_pressed(global.gamepad_id, gp_padd) or axis_down_pressed;
enter = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(global.gamepad_id,gp_face1)
	
}