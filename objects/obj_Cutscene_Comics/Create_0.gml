global.skip = false
comics = [
    spr_Cutscene_1,spr_Cutscene_2,spr_Cutscene_3,
    spr_Cutscene_4,spr_Cutscene_5,spr_Cutscene_6,
    spr_Cutscene_7,spr_Cutscene_8,spr_Cutscene_9,
    spr_Cutscene_10,spr_Cutscene_11,spr_Cutscene_12
];

current = 0;
next = -1;
progress = 0;
dir = 0;

cutscene_timer = 0; // contador
cutscene_delay = room_speed * 5; // tempo em steps (3 segundos por quadro)
