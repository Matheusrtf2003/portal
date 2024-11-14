import { baseURL } from '../../../statics/js/config.js';
import { allStores, displayStores, updateResultCount } from './storeManagement.js';
import { loadMarkers} from './loadMarkers.js';
import { clearMapMarkers } from './mapMarkers.js';
import { geocodeAddress } from './geocoding.js';

export async function applyFilters() {
    const queryInput = document.getElementById('searchInput');
    const query = queryInput ? queryInput.value.toLowerCase() : '';

    const statusSelect = document.getElementById('filterStatusSelect');
    const status = statusSelect ? statusSelect.value.toLowerCase() : '';

    const stateSelect = document.getElementById('filterStateSelect');
    const state = stateSelect ? stateSelect.value.toLowerCase() : '';

    const usuarioSelect = document.getElementById('filterUsuarioSelect');
    const usuario = usuarioSelect ? usuarioSelect.value : ''; 

    const perfilSelect = document.getElementById('filterPerfilSelect');
    const perfil = perfilSelect ? perfilSelect.value.toLowerCase() : ''; 

    const vendedorSelect = document.getElementById('filterVendedorSelect');
    const vendedor = vendedorSelect ? vendedorSelect.value : ''; 

    const hunterSelect = document.getElementById('filterHunterSelect');
    const hunter = hunterSelect ? hunterSelect.value : ''; 

    const filteredStoresLocal = allStores.filter(store => {
        const matchQuery = store.nome.toLowerCase().includes(query) || store.cidade.toLowerCase().includes(query);
        const matchStatus = !status || store.status.toLowerCase() === status;
        const matchState = !state || store.estado.toLowerCase() === state;
        const matchUsuario = !usuario || store.usuario_id == usuario;
        const matchPerfil = !perfil || (store.perfil_loja && store.perfil_loja.toLowerCase() === perfil);
        const matchVendedor = !vendedor || (store.vendedor_id && store.vendedor_id.toString() === vendedor.toString()); 
        const matchHunter = !hunter || (store.hunter_id && store.hunter_id.toString() === hunter.toString());

        return matchQuery && matchStatus && matchUsuario && matchVendedor && matchState && matchPerfil && matchHunter;
    });

    displayStores(filteredStoresLocal);
    updateResultCount(filteredStoresLocal.length);

    // Verifica as coordenadas e faz geocodificação para lojas sem coordenadas
    await Promise.all(filteredStoresLocal.map(async (store) => {
        if (!store.latitude || !store.longitude) {
            const address = `${store.endereco}, ${store.cidade}, ${store.estado}`;
            const location = await geocodeAddress(address);

            if (location) {
                store.latitude = location.lat;
                store.longitude = location.lng;
            }
        }
    }));

    // Limpa e recarrega os marcadores
    clearMapMarkers();
    loadMarkers(filteredStoresLocal);
}

// Limpa todos os filtros
function clearFilters() {
    const queryInput = document.getElementById('searchInput');
    if (queryInput) queryInput.value = '';

    const statusSelect = document.getElementById('filterStatusSelect');
    if (statusSelect) statusSelect.selectedIndex = 0;

    const stateSelect = document.getElementById('filterStateSelect');
    if (stateSelect) stateSelect.selectedIndex = 0;

    const usuarioSelect = document.getElementById('filterUsuarioSelect');
    if (usuarioSelect) usuarioSelect.selectedIndex = 0;

    const vendedorSelect = document.getElementById('filterVendedorSelect');
    if (vendedorSelect) vendedorSelect.selectedIndex = 0;

    const perfilSelect = document.getElementById('filterPerfilSelect');
    if (perfilSelect) perfilSelect.selectedIndex = 0;

    const hunterSelect = document.getElementById('filterHunterSelect');
    if (hunterSelect) hunterSelect.selectedIndex = 0;

    // Aplicar filtros com tudo resetado
    applyFilters();
}

async function loadAvailableVendedores() {
    const vendedorSelect = document.getElementById('filterVendedorSelect');
    try {
        const response = await fetch(`${baseURL}/functions/Maps/getVendedores.php`);
        const data = await response.json();

        if (Array.isArray(data)) { // Verifica se data é um array diretamente
            vendedorSelect.innerHTML = '<option value="">Todos os vendedores</option>';
            data.forEach(vendedor => {
                const option = document.createElement('option');
                option.value = vendedor.id;
                option.textContent = vendedor.nome;
                vendedorSelect.appendChild(option);
            });
            console.log("Vendedores carregados:", data);
        } else {
            console.error("Formato inesperado ao carregar vendedores:", data);
        }
    } catch (error) {
        console.error("Erro ao carregar vendedores:", error);
    }
}

// Carregar hunters únicos
async function loadAvailableHunters() {
    const hunterSelect = document.getElementById('filterHunterSelect');
    if (!hunterSelect) {
        console.error("Elemento filterHunterSelect não encontrado no DOM.");
        return;
    }
    try {
        const response = await fetch(`${baseURL}/functions/Maps/getHunters.php`);
        const hunters = await response.json();

        if (Array.isArray(hunters)) { // Verifique se é um array
            hunterSelect.innerHTML = '<option value="">Todos os hunters</option>';
            hunters.forEach(hunter => {
                const option = document.createElement('option');
                option.value = hunter.id;
                option.textContent = hunter.nome;
                hunterSelect.appendChild(option);
            });
            console.log("Hunters carregados:", hunters);
        } else {
            console.error("Formato inesperado ao carregar hunters:", hunters);
        }
    } catch (error) {
        console.error("Erro ao carregar hunters:", error);
    }
}

// Carregar dados ao iniciar a página
document.addEventListener('DOMContentLoaded', function () {
    loadAvailableVendedores();
    loadAvailableHunters();
    const clearFiltersButton = document.getElementById('clearFiltersButton');
    if (clearFiltersButton) {
        clearFiltersButton.addEventListener('click', clearFilters);
    }
});
