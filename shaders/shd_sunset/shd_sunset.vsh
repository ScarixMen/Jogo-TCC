// shd_sunset.vsh
attribute vec3 in_Position;      // Posição do vértice
attribute vec4 in_Colour;        // Cor do vértice (não usaremos diretamente)
attribute vec2 in_TextureCoord;  // Coordenadas de textura do vértice

varying vec2 v_vTexCoord;        // Variável para passar as coordenadas UV para o fragment shader
varying vec4 v_vColour;          // Variável para passar a cor (neste caso, não usaremos muito)

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_vTexCoord = in_TextureCoord;
    v_vColour = in_Colour;
}