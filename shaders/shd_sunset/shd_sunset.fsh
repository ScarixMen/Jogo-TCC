// shd_sunset.fsh
varying vec2 v_vTexCoord;

uniform float u_screenHeight;
uniform float u_alpha; // ADICIONE ESTA LINHA: Uniform para controlar a opacidade

void main()
{
    float normalizedY = gl_FragCoord.y / u_screenHeight;
    vec3 finalColorRGB; // Renomeado para evitar conflito com gl_FragColor

    // Definição das cores (mantenha como está ou ajuste para a intensidade desejada)
    vec3 topColor        = vec3(0.25, 0.0, 0.25);
    vec3 upperMidColor   = vec3(0.6, 0.1, 0.3);
    vec3 midColor        = vec3(1.0, 0.3, 0.1);
    vec3 lowerMidColor   = vec3(1.0, 0.5, 0.0);
    vec3 horizonColor    = vec3(1.0, 0.7, 0.2);

    // Interpolação das cores
    if (normalizedY < 0.2) {
        finalColorRGB = mix(topColor, upperMidColor, normalizedY / 0.2);
    } else if (normalizedY < 0.4) {
        finalColorRGB = mix(upperMidColor, midColor, (normalizedY - 0.2) / 0.2);
    } else if (normalizedY < 0.7) {
        finalColorRGB = mix(midColor, lowerMidColor, (normalizedY - 0.4) / 0.3);
    } else {
        finalColorRGB = mix(lowerMidColor, horizonColor, (normalizedY - 0.7) / 0.3);
    }

    // AQUI ESTÁ A MUDANÇA PRINCIPAL: Use u_alpha para o componente alfa (opacidade)
    gl_FragColor = vec4(finalColorRGB, u_alpha); // Use o alpha passado pelo GML
}