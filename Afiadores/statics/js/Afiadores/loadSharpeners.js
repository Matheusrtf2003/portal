// loadSharpeners.js

let currentPage = 1;
const itemsPerPage = 20;
let allSharpeners = [];
let filteredSharpeners = [];

document.addEventListener('DOMContentLoaded', function () {
    loadAllSharpeners();
    setupEventListeners();
});

function loadAllSharpeners() {
    fetch('../functions/Sharpeners/getSharpeners.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                allSharpeners = data.sharpeners;
                applyFilters();
            } else {
                console.error('Erro ao carregar afiadores:', data.message);
                alert('Erro ao carregar afiadores: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Erro ao carregar afiadores:', error);
            alert('Erro ao carregar afiadores. Verifique o console para mais detalhes.');
        });
}
