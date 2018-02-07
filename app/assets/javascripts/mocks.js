setMockPositions = function () {
  $('div.mock').each(function(i) {
        $(this).data('new-pos', i);
  });
}

updateMocksOrder = function (event) {
  event.preventDefault();
  
  setMockPositions();

  var $sortable = $('.sortable');

  var updates = [];

  $('div.mock').each(function(i) {
    var $element = $(this),
        old_pos = $element.data('old-pos'),
        new_pos = $element.data('new-pos');

        console.log(old_pos, new_pos);

    if (old_pos != new_pos) {
      updates.push({id: $element.data('mock-id'), order: new_pos});
    }
  });

  var success_url = $sortable.data('mock-success-url');

  if (updates.length > 0) {
    var url = $sortable.data('mock-url'),
        method = $sortable.data('mock-method');

    $.ajax({
      type: method,
      url: url,
      data: { order: updates },
      success: function () {
        document.location = success_url;
      }
    });
  } else {
    document.location = success_url;
  }
}

$(function(){
  if ($('form.mock-form').find('.tabs-content .content').length > 0) {
    var first_error_tab = null;

    $('form.mock-form').find('.tabs-content .content').each(function(index, element) {
      var $element = $(element);
      var elementId = $element.prop('id');
      var $tabLink = $('a[href="#' + elementId + '"]');

      if ($element.find('small.error').length) {
        $tabLink.addClass('error');

        if (!first_error_tab) {
          first_error_tab = $tabLink;
        }
      }
    });

    if (first_error_tab) {
      first_error_tab.trigger('click');
    }
  }

  $('.update-mocks-order').on('click', updateMocksOrder);
});
