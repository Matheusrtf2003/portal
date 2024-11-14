import { processStoreCoordinates } from './coordinates.js';
import { addMarkerToMap, clearMapMarkers } from './mapMarkers.js';

// Função principal para carregar marcadores no mapa com base em uma lista de lojas e educadoras
export async function loadMarkers(stores) {
    clearMapMarkers();

    for (const store of stores) {
        let location = await processStoreCoordinates(store);
        if (location) {
            addMarkerToMap(location, store);
        }
    }
}
