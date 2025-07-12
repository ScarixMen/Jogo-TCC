function Input_Luana(){
	
	if global.cam_override
	{
		state = Luana_State_Idle
		exit;	
	
	}
	
	if global.dialog
	{
		state = Luana_State_Idle
		exit;	
	
	}
	
	left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25 or keyboard_check(vk_left) or gamepad_button_check(global.gamepad_id,gp_padl)
	right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25 or keyboard_check(vk_right) or gamepad_button_check(global.gamepad_id,gp_padr)
	move = -left+right
	
	jump = gamepad_button_check_pressed(global.gamepad_id,gp_face1) or keyboard_check(vk_up)
	
}

function Input_Apollo(){
	
	if global.cam_override
	{
		
		state = Apollo_State_Idle
		exit;	
	
	}
	
	if global.dialog
	{
	
		state = Apollo_State_Idle
		exit;	
	
	}

	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	move = -left+right
	
	jump = keyboard_check_pressed(vk_space)
	
	crounch = keyboard_check(vk_control)

}

function Input_Menu(){
	
// No step:
var limiar = 0.5;
var eixo_valor = gamepad_axis_value(global.gamepad_id, gp_axislv);

// Detectar pressed UP (subida do eixo passa do limiar negativo)
var axis_up_now = (eixo_valor < -limiar);
var axis_up_pressed = (axis_up_now == true) and (axis_up_previously == false);
axis_up_previously = axis_up_now;

// Detectar pressed DOWN (descida do eixo passa do limiar positivo)
var axis_down_now = (eixo_valor > limiar);
var axis_down_pressed = (axis_down_now == true) and (axis_down_previously == false);
axis_down_previously = axis_down_now;

// Agora você pode usar axis_up_pressed e axis_down_pressed como pressed
up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(global.gamepad_id, gp_padu) or axis_up_pressed;
down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or gamepad_button_check_pressed(global.gamepad_id, gp_padd) or axis_down_pressed;
enter = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(global.gamepad_id,gp_face1)
	
}
function Input_Dialog(){

skip = keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(global.gamepad_id,gp_face2)

}