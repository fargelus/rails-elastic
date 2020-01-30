$(() => {
  function searchUser() {
    const $userQuery = $('#user_query');
    const $userSearchResult = $('#user-search-result');
    const userSearchResultSuccessClass = 'order-form__user-search-result';
    const $userSearchBtn = $('#search-user-btn');
    const $userID = $('#order_user_id');

    $userSearchBtn.click(() => {
      const query = $userQuery.val();
      const $el = $(this);

      if (query) {
        $el.attr('disabled', true);
        $.getJSON('/search-user', { query: query })
         .then(response => handleUserSearchResponse(response));
      }
    });

    const handleUserSearchResponse = (response) => {
      response.email ? saveUserAsSearchResult(response) : resetSearchResult();
      $userSearchBtn.removeAttr('disabled');
    }

    const saveUserAsSearchResult = response => {
      const { id, email } = response;
      $userSearchResult
        .text(email)
        .addClass(userSearchResultSuccessClass);
      $userID.val(id);
    }

    const resetSearchResult = () => {
      $userSearchResult
        .text('')
        .removeClass(userSearchResultSuccessClass);
      $userID.val('');
    }
  }

  searchUser();
});
