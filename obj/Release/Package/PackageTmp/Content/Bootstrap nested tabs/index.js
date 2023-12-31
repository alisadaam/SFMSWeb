$('#interest_tabs').on('click', 'a[data-toggle="tab"]', function(e) {
      e.preventDefault();

      var $link = $(this);
      if (!$link.parent().hasClass('active')) {
          if ($(this).data("islink") == "1") {
              window.location = $link.attr('href');

          }
          else {
              //remove active class from other tab-panes
              $('.tab-content:not(.' + $link.attr('href').replace('#', '') + ') .tab-pane').removeClass('active');

              // click first submenu tab for active section
              $('a[href="' + $link.attr('href') + '_all"][data-toggle="tab"]').click();

              // activate tab-pane for active section
              $('.tab-content.' + $link.attr('href').replace('#', '') + ' .tab-pane:first').addClass('active');
          }
      }
    });