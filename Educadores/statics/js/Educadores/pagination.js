let currentPage = 1; // Defina a página atual globalmente
const itemsPerPage = 20; // Defina quantos itens por página


function changePage(direction) {
    currentPage += direction;
    if (currentPage < 1) {
        currentPage = 1;
    }
    if (currentPage > Math.ceil(filteredEducators.length / itemsPerPage)) {
        currentPage = Math.ceil(filteredEducators.length / itemsPerPage);
    }
    applyFilters(); // Recarrega a tabela com base na nova página
}

document.getElementById('prevPage').addEventListener('click', function() {
    changePage(-1);
});

document.getElementById('nextPage').addEventListener('click', function() {
    changePage(1);
});
