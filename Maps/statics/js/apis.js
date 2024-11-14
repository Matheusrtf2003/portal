import { baseURL } from '../../../statics/js/config.js';

// Função para buscar coordenadas do banco de dados
export async function fetchCoordinatesFromDatabase(address) {
    try {
        const response = await fetch(`${baseURL}/functions/Geocoding/getCoordinates.php?address=${encodeURIComponent(address)}`);
        if (!response.ok) {
            console.error('Erro ao buscar coordenadas, resposta do servidor:', response.status);
            return null;
        }

        const data = await response.json();
        if (data.success) {
            return { lat: parseFloat(data.lat), lng: parseFloat(data.lng) };
        } else {
            console.error('Dados inválidos ao buscar coordenadas:', data);
            return null;
        }
    } catch (error) {
        console.error('Erro ao buscar coordenadas no banco de dados:', error);
        return null;
    }
}

// Função para geocodificar um endereço usando a API do Google
export async function fetchCoordinatesFromGeocodingAPI(address, retryCount = 0) {
    if (!address) {
        console.error('Endereço inválido fornecido para geocodificação');
        return null;
    }

    const apiKey = 'AIzaSyAnqVbnVlRY2EaQL7pzLQMKMhBGxm6T02c&'; // Substitua pela sua chave API do Google Maps
    const url = `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(address)}&key=${apiKey}`;

    try {
        const response = await fetch(url);
        const data = await response.json();

        if (data.status === 'OK') {
            return data.results[0].geometry.location;
        } else if (data.status === 'OVER_QUERY_LIMIT' && retryCount < 5) {
            console.warn('Over query limit, esperando para tentar novamente...');
            await delay(3000 * Math.pow(2, retryCount));
            return await fetchCoordinatesFromGeocodingAPI(address, retryCount + 1);
        } else {
            console.error('Erro ao geocodificar o endereço:', data.status);
            return null;
        }
    } catch (error) {
        console.error('Erro ao geocodificar o endereço:', error);
        return null;
    }
}

// Função para adicionar atraso
function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
