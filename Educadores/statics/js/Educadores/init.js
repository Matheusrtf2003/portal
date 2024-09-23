// init.js

document.addEventListener('DOMContentLoaded', function () {
    loadEducators();

    document.getElementById('searchInput').addEventListener('input', applyFilters);

    document.getElementById('selectAll').addEventListener('change', function() {
        const checkboxes = document.querySelectorAll('.select-row');
        checkboxes.forEach(checkbox => checkbox.checked = this.checked);
    });
});
