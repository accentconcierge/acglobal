jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  user.setupForm()

user =
  setupForm: ->
    $('#new_user').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        user.processCard()
        false
      else
        true
 
  processCard: ->
    card =
      name: $('#name').val()
      address_line1: $('#address').val()
      address_city: $('#address_city').val()
      address_state: $('#address_state').val()
      address_zip: $('#address_zip').val()
      address_country: $('#address_country').val()
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, user.handleStripeResponse)
 
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#user_stripe_card_token').val(response.id)
      $('#new_user')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('#stripe_error').show()
      $('input[type=submit]').attr('disabled', false)



