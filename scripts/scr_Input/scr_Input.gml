function Input_Player(){
	
	pause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(global.gamepad_id,gp_start)
	global.skip = keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(global.gamepad_id,gp_face1) or keyboard_check_pressed(vk_space)
	
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
		if(object_index == obj_Luana){
		    if(global.damage)
		    {
		        state = Luana_State_Death;
		        exit;
		    }
		    state = Luana_State_Idle;
		    exit;
		}
	}
#endregion

	left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25 or keyboard_check(vk_left) or gamepad_button_check(global.gamepad_id,gp_padl)
	right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25 or keyboard_check(vk_right) or gamepad_button_check(global.gamepad_id,gp_padr)
	move = -left+right
	
	interact_Luana = gamepad_button_check_pressed(global.gamepad_id,gp_face3) or keyboard_check_pressed(vk_rshift)
	
	jump = !global.skip and (gamepad_button_check_pressed(global.gamepad_id, gp_face1) or keyboard_check_pressed(vk_up));

	pause = gamepad_button_check_pressed(global.gamepad_id,gp_face1)
	
	
	
}
function Input_Luana_God(){
	
	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	up = keyboard_check(ord("W"))
	down = keyboard_check(ord("S"))
	move = -left+right
	movev = -up+down
	
	interact_Apollo = keyboard_check_pressed(ord("E"))
	
}

function Input_Apollo(){
	
	#region	Block Input
	if global.cam_override
	{
		if(state != Apollo_State_Death){
		state = Apollo_State_Cutscene}
		exit;
	
	}
	if (global.dialog && obj_Apollo.can_control)
	{
		if(object_index == obj_Apollo){
		    if(global.damage)
		    {
		        state = Apollo_State_Death;
		        exit;
		    }
		    state = Apollo_State_Idle;
		    exit;
		}
	}
	
	#endregion
	
	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	move = -left+right
	
	interact_Apollo = keyboard_check_pressed(ord("E"))
	
	jump = keyboard_check_pressed(vk_space)
	
	crounch = keyboard_check(vk_lcontrol)
	
	

}
function Input_Apollo_God(){
	
	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	up = keyboard_check(ord("W"))
	down = keyboard_check(ord("S"))
	move = -left+right
	movev = -up+down
	
	interact_Apollo = keyboard_check_pressed(ord("E"))
	
}

function Input_Menu(){
	
// No step:
var limiar = 0.5;
var eixo_valor_v = gamepad_axis_value(global.gamepad_id, gp_axislv);
var eixo_valor_h = gamepad_axis_value(global.gamepad_id, gp_axislh);

var axis_up_now = (eixo_valor_v < -limiar);
var axis_up_pressed = (axis_up_now == true) and (axis_up_previously == false);
axis_up_previously = axis_up_now;

var axis_down_now = (eixo_valor_v > limiar);
var axis_down_pressed = (axis_down_now == true) and (axis_down_previously == false);
axis_down_previously = axis_down_now;

var axis_right_now = (eixo_valor_h > limiar);
var axis_right_pressed = (axis_right_now == true) and (axis_right_previously == false);
axis_right_previously = axis_right_now;

var axis_left_now = (eixo_valor_h > -limiar);
var axis_left_pressed = (axis_left_now == true) and (axis_left_previously == false);
axis_left_previously = axis_left_now;



pause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(global.gamepad_id,gp_start)

back = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_rshift) or gamepad_button_check_pressed(global.gamepad_id,gp_face2)

right = keyboard_check_pressed(ord("D")) or axis_right_pressed or keyboard_check_pressed(vk_right) or gamepad_button_check_pressed(global.gamepad_id,gp_padr);
left = keyboard_check_pressed(ord("A")) or axis_left_pressed or keyboard_check_pressed(vk_left) or gamepad_button_check_pressed(global.gamepad_id,gp_padl);
up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(global.gamepad_id, gp_padu) or axis_up_pressed;
down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or gamepad_button_check_pressed(global.gamepad_id, gp_padd) or axis_down_pressed;
enter = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(global.gamepad_id,gp_face1)
	
}