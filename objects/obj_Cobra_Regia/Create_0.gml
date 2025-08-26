// Retângulo base
// Criar a hitbox da cobra
hitbox = instance_create_layer(x, y, "Instances", obj_Colision_Cobra_Regia);
hitbox.owner = id; // referencia a cobra "dona" da hitbox


base = instance_nearest(x,y,obj_Plataform_Cobra);

// Velocidade de deslocamento
speed = 2;

// Inicialização
side_index = 0;    // lado atual: 0=topo,1=direita,2=baixo,3=esquerda
pos_on_side = 0;   // posição ao longo do lado

// Sprites correspondentes a cada lado
// Ordem: 0=topo, 1=direita, 2=baixo, 3=esquerda
side_sprites = [spr_Cobra_Regia_Walking_cima, spr_Cobra_Regia_Walking_dir, spr_Cobra_Regia_Walking_baixo, spr_Cobra_Regia_Walking_esq];

