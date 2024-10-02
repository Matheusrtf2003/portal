let currentPage = 1;
const itemsPerPage = 20; // Quantidade de itens por página

// Função para trocar de página
function changePage(direction) {
    currentPage += direction;

    // Verifica o total de páginas baseado nos itens filtrados
    const totalPages = Math.ceil(filteredStores.length / itemsPerPage);
    
    if (currentPage < 1) {
        currentPage = 1;
    } else if (currentPage > totalPages) {
        currentPage = totalPages;
    }

    // Aplicar os filtros e atualizar a exibição de lojas
    applyFilters();
    updatePageNumberDisplay();
}

// Função para atualizar o número da página exibida
function updatePageNumberDisplay() {
    const totalPages = Math.ceil(filteredStores.length / itemsPerPage);
    document.getElementById('currentPageDisplay').textContent = `Página ${currentPage} de ${totalPages}`;
}

// Função para aplicar os filtros e exibir a página correta
function applyFilters() {
    // Certifica-se de aplicar os filtros corretamente
    displayStores(filteredStores);
    updatePageNumberDisplay();
}
