// init.js

document.addEventListener('DOMContentLoaded', function () {
    const userIdElement = document.getElementById('userId');
    if (userIdElement) {
        const user_id = userIdElement.value;
        initializeGoalForm();
        loadGoals(user_id);
        if (document.getElementById('lineChart') && document.getElementById('pieChart')) {
            loadDashboardCharts(user_id);
        }
    } else {
        console.error('Element with id "userId" not found.');
    }
});
