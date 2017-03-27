/* global $, Stripe */
//Document Ready
$('document').on('turbolinks:load', function(){
  // Catching the signup form for Pro plan
  var theForm = $('#pro-form');
  // Catching the Submit button for Pro Plan
  var suBtn = $('#form-submit-btn');
  // Set stripe publishable key 
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  suBtn.click(function(event){
    //prevent default submission behavior.
    event.preventDefault();
    suBtn.val("Processing").prop('disabled', true);
    
     //Collect the credit card fields.
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();
    
    // Create token using the Card Details
    var error = false;
    
    if(!Stripe.card.validateCardNumber(ccNum)){
      error = true;
      alert('The credit card number appears to be invalid');  
    }
    if(!Stripe.card.validateCVC(cvcNum)){
      error = true;
      alert('The CVC number appears to be invalid');
    }
    if(!Stripe.card.validateExpiry(expMonth, expYear)){
      error = true;
      alert('The expiration date appears to be invalid');
    }
    if(error){
      //If there are card errors, don't send to Stripe.
      suBtn.prop('disabled', false).val("Sign Up");
    }
    else{
    Stripe.card.createToken({
    number: $('#card_number').val(),
    cvc: $('#card_code').val(),
    exp_month: $('#card_month').val(),
    exp_year: $('#card_year').val()
    }, stripeResponseHandler);  
    }
    return false;
  });
  function stripeResponseHandler(status, response) {

  // Grab the form:
    var $form = $('#pro_form');

    // Get the token ID:
    var token = response.id;

    // Insert the token into the form so it gets submitted to the server:
    $form.append($('<input name="user[stripe_card_token]" id="plan" value="2" type="hidden">').val(token));
    
    // Submit the form:
    $form.get(0).submit();

  }
});