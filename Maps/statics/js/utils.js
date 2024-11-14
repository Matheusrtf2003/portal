// Função para validar coordenadas
export function isValidCoordinate(lat, lng) {
    return (
        lat !== undefined && lng !== undefined &&
        lat !== null && lng !== null &&
        !isNaN(lat) && !isNaN(lng) &&
        lat >= -90 && lat <= 90 &&
        lng >= -180 && lng <= 180
    );
}

// Função de atraso para limitar a quantidade de requisições em um curto período
export function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
