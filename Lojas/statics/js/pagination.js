let currentPage = 1;
const itemsPerPage = 20;

// Troca a página atual
function changePage(direction) {
    currentPage += direction;

    // Verifica se não estamos fora do intervalo de páginas
    const totalPages = Math.ceil(filteredStores.length / itemsPerPage);
    if (currentPage < 1) {
        currentPage = 1;
    } else if (currentPage > totalPages) {
        currentPage = totalPages;
    }

    applyFilters();
    updatePageNumberDisplay();
}

// Atualiza o número da página exibido
function updatePageNumberDisplay() {
    const totalPages = Math.ceil(filteredStores.length / itemsPerPage);
    document.getElementById('currentPageDisplay').textContent = `Página ${currentPage} de ${totalPages}`;
}

// Aplique a função de página quando carregar as lojas
function applyFilters() {
    // Lógica de filtros aqui
    displayStores(filteredStores);
    updatePageNumberDisplay();
}
