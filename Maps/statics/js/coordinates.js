import { fetchCoordinatesFromDatabase, fetchCoordinatesFromGeocodingAPI } from './apis.js';

// Processar coordenadas para um endereço específico
export async function processStoreCoordinates(store) {
    const address = store.endereco;

    // Verificar se as coordenadas estão no banco de dados
    let coordinates = await fetchCoordinatesFromDatabase(address);
    if (coordinates) {
        return coordinates;
    }

    // Caso não encontre no banco, tenta geocodificar usando a API do Google
    console.warn(`Coordenadas não encontradas. Tentando geocodificar: ${store.nome}`);
    coordinates = await fetchCoordinatesFromGeocodingAPI(address);

    if (coordinates) {
        // Salvar coordenadas no banco de dados
        await saveCoordinatesToDatabase(address, coordinates.lat, coordinates.lng);
        return coordinates;
    } else {
        console.error(`Coordenadas inválidas para a loja ${store.nome}. Latitude: ${coordinates?.lat}, Longitude: ${coordinates?.lng}`);
        return null;
    }
}

// Função para salvar as coordenadas no banco de dados (exemplo fictício)
async function saveCoordinatesToDatabase(address, lat, lng) {
    try {
        const response = await fetch(`${baseURL}/functions/Geocoding/saveCoordinates.php`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ address, lat, lng })
        });

        const data = await response.json();
        if (!data.success) {
            console.error('Erro ao salvar coordenadas no banco de dados:', data);
        }
    } catch (error) {
        console.error('Erro ao tentar salvar as coordenadas no banco de dados:', error);
    }
}
