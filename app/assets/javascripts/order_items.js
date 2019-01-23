jQuery(function() {
  return $('#item_name').autocomplete({
    source: $('#item_name').data('autocomplete-source')
  });
});

