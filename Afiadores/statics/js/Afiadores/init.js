// init.js

document.addEventListener('DOMContentLoaded', function () {
    loadAllSharpeners();
    setupEventListeners();
});

function setupEventListeners() {
    const searchInput = document.getElementById('searchInput');
    const filterStatus = document.getElementById('filterStatus');
    const filterSituation = document.getElementById('filterSituation');
    const filterDateStart = document.getElementById('filterDateStart');
    const filterDateEnd = document.getElementById('filterDateEnd');

    if (searchInput) searchInput.addEventListener('input', applyFilters);
    if (filterStatus) filterStatus.addEventListener('change', applyFilters);
    if (filterSituation) filterSituation.addEventListener('change', applyFilters);
    if (filterDateStart) filterDateStart.addEventListener('change', applyFilters);
    if (filterDateEnd) filterDateEnd.addEventListener('change', applyFilters);
}
