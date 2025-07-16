function scr_iniciar_genius() {
    if (ativo) exit; // ← Isso evita que ele reinicie se já estiver ativo

    ativo = true;
    estado = "tocando";
    sequencia = [];
    indice_atual = 0;
    tempo_atual = 0;
    indice_entrada = 0;

    array_push(sequencia, irandom(3));
}
