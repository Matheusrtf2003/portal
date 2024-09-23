document.getElementById('selectAll').addEventListener('click', function(event) {
    const checkboxes = document.querySelectorAll('.select-store');
    checkboxes.forEach(checkbox => checkbox.checked = event.target.checked);
});
