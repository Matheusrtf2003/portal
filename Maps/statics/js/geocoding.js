const cache = {};

export async function geocodeAddress(address, retryCount = 0) {
    if (!address || address.trim() === "") {
        console.error('Endereço inválido fornecido para geocodificação');
        return null;
    }

    const apiKey = 'AIzaSyAnqVbnVlRY2EaQL7pzLQMKMhBGxm6T02c&'; // Substitua pela sua chave da API do Google Maps
    const url = `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(address)}&key=${apiKey}`;
    try {
        const response = await fetch(url);
        const data = await response.json();

        if (data.status === 'OK') {
            return data.results[0].geometry.location;
        } else if (data.status === 'OVER_QUERY_LIMIT' && retryCount < 5) {
            console.warn('Over query limit, esperando para tentar novamente...');
            await delay(2000 * (retryCount + 1)); // Backoff exponencial
            return await geocodeAddress(address, retryCount + 1);
        } else {
            console.error('Erro ao geocodificar o endereço:', data.status);
            return null;
        }
    } catch (error) {
        console.error('Erro na solicitação de geocodificação:', error);
        return null;
    }
}

function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
