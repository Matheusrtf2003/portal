document.addEventListener('DOMContentLoaded', function () {
    // Garantindo que a função loadAllStores existe antes de chamá-la
    if (typeof loadAllStores === 'function') {
        loadAllStores();
    }

    // Verifique se cada elemento existe antes de adicionar um listener
    const searchInput = document.getElementById('searchInput');
    if (searchInput) {
        searchInput.addEventListener('input', applyFilters);
    }

    const filterStatusSelect = document.getElementById('filterStatusSelect');
    if (filterStatusSelect) {
        filterStatusSelect.addEventListener('change', applyFilters);
    }

    const filterMarkers = document.getElementById('filterMarkers');
    if (filterMarkers) {
        filterMarkers.addEventListener('change', applyFilters);
    }

    const selectAll = document.getElementById('selectAll');
    if (selectAll) {
        selectAll.addEventListener('change', toggleAllMarkers);
    }

    const applyFilterButton = document.getElementById('applyFilterButton');
    if (applyFilterButton) {
        applyFilterButton.addEventListener('click', filterByState);
    }

    const applyStatusFilterButton = document.getElementById('applyStatusFilterButton');
    if (applyStatusFilterButton) {
        applyStatusFilterButton.addEventListener('click', filterByStatus);
    }
});
