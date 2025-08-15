enum Estado {
    ANDANDO,
    SUBINDO,
    DESCENDO
}

estado = Estado.ANDANDO;
spd = 3;

// Cria o visual separado
inst_visual = instance_create_layer(x, y, layer, obj_Cobra_Regia);

cooldown_subida = 0