// Divida um array em pedaços menores
function chunkArray(array, chunkSize) {
    const results = [];
    for (let i = 0; i < array.length; i += chunkSize) {
        results.push(array.slice(i, i + chunkSize));
    }
    return results;
}

// Verifica se a data é mais antiga que 9 meses
function isOlderThanNineMonths(date) {
    const nineMonthsAgo = new Date();
    nineMonthsAgo.setMonth(nineMonthsAgo.getMonth() - 9);
    return date < nineMonthsAgo;
}
