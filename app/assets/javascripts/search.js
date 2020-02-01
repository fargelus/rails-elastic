$(() => {
  const $searchResults = $('#search-results');
  const $tableHeader = $searchResults.find('thead');
  const $tableBody = $searchResults.find('tbody');

  $('#search-by-all-form').on('ajax:success', info => {
    clearTableData();
    const data = info.detail[0];
    if (data.length) {
      const firstEl = data[0];
      addHeadersToResultTable(Object.keys(firstEl));
      addElementsToResultTable(data);
    }
  });

  function clearTableData() {
    $tableHeader.empty();
    $tableBody.empty();
  }

  function addHeadersToResultTable(data) {
    data.forEach(el => $tableHeader.append(`<th>${el}</th>`));
  }

  function addElementsToResultTable(elements) {
    elements.forEach(elem => {
      Object.values(elem).forEach(value => $tableBody.append(`<td>${value}</td>`));
    });
  }
});
