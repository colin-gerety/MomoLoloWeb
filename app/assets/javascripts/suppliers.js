jQuery(function() {
  return $('#supplier_name').autocomplete({
    source: $('#supplier_name').data('autocomplete-source')
  });
});

