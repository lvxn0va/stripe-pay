# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
	payment.setupForm()
	
payment =
	setupForm: ->
		$('#new_payment').submit ->
			$('input[type=submit]').attr('disabled', true)
			$('div.error').remove()
			if $('#card_number').length
				payment.processCard()
				false
			else
				true
	processCard: ->
		card =
			number: $('#card_number').val()
			cvc: $('#card_code').val()
			expMonth: $('#card_month').val()
			expYear: $('#card_year').val()
		console.log(card.number)
		Stripe.createToken(card, payment.handleStripeResponse)
	handleStripeResponse: (status, response) ->
		if status == 200
			$('#payment_stripe_card_token').val(response.id)
			$('#new_payment')[0].submit()
		else
			error = $(document.createElement( 'div' ))
			error.addClass('error')
			error.text(response.error.message)
			$('.actions').prepend(error)
			$('input[type=submit]').attr('disabled', false)
			