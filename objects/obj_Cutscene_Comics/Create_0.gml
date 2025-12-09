global.skip = false
comics = [
    spr_Cutscene_1,spr_Cutscene_2,spr_Cutscene_3,
    spr_Cutscene_4,spr_Cutscene_5,spr_Cutscene_6,
	spr_Cutscene_7,spr_Cutscene_8,spr_Cutscene_9,
	spr_Cutscene_10,spr_Cutscene_11,spr_Cutscene_12,
	spr_Cutscene_13,spr_Cutscene_14,spr_Cutscene_15,
	spr_Cutscene_16,spr_Cutscene_17,spr_Cutscene_18,
	spr_Cutscene_19,spr_Cutscene_20
];

current = 0;
next = -1;
progress = 0;
dir = 0;

cutscene_timer = 0;
cutscene_delay = room_speed * 2
dialog_delay = room_speed * 2
dialog_timer = 0

if (!instance_exists(obj_Dialog_Cutscene_0)) {
	var d = instance_create_layer(x, y, layer, obj_Dialog_Cutscene_0);
	d.npc_name = "Cutscene_0";
	global.dialog = true;
}

dialog_count = 0;   // quantos diálogos já foram mostrados no quadro 16
dialog_done = false;
dialog_step = 0;      // controla quantos skips foram aplicados no quadro 16