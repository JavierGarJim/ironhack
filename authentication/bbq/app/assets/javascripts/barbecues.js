// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function main () {
  var isJoining = false

  $('[data-hook~=join-bbq]').on('click', function (event) {
    if (isJoining) {
      return
    }

    isJoining = true
    var $button = $(event.target)
    var bbqId = $button.closest('[data-bbq]').data('bbq')

    var request = $.post('/api/barbecues/' + bbqId + '/join')

    request.fail(function () {
      alert('Couldn’t join the barbecue. Try again later.')
      isJoining = false
    })

    request.done(function () {
      $button.fadeOut()
      isJoining = false
    })
  });

  $('.js-item-table').on('click', '.js-item-add', function (event) {
    event.preventDefault();
    var $button = $(event.target);
    var bbqId = $button.closest('[data-bbq]').data('bbq');
    var item_name = $('.js-item-name')[0].value;

    var request = $.post('/api/barbecues/' + bbqId + '/items', {item_name: item_name});

    request.fail(function () {
      alert('Couldn’t add the item. Try again later.')
    });

    request.done(function (response) {
      $('.js-item-form')[0].reset();
      $('.js-item-list').empty();

      response.items.forEach(function(i) {
        var li = `
                  <li>
                    ${i.name}
                  </li>
                  `;

        $('.js-item-list').append(li);
      });
    });
  });

  if ($('[data-hook~=controller-barbecues][data-hook~=action-show]').length) {
    var $bbqContainer = $('[data-hook=bbq-info]')
    var bbqId = $bbqContainer.data('bbq')
    var request = $.get('/api/barbecues/' + bbqId)

    request.fail(function () {
      var htmlParts = [
        '<div class="alert alert-danger" role="alert">',
        '  There was a problem retrieving the BBQ info. Try again later.',
        '</div>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
    })

    request.done(function (bbq) {
      var bbqMoment = moment(bbq.date)
      var htmlParts = [
        '<h2>' + bbq.title + '</h2>',
        '<dl>',
        '  <dt>Date:</dt>',
        '  <dd>' + bbqMoment.format('MMMM, D YYYY [at] h:mm a') + '</dd>',
        '  <dt>Venue:</dt>',
        '  <dd>' + bbq.venue + '</dd>',
        '</dl>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
    })
  }
})()
