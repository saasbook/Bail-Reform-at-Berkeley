# Bail-Reform-at-Berkeley
http://bail-reform-at-berkeley.herokuapp.com/

 [![Maintainability](https://api.codeclimate.com/v1/badges/e8e59eb80fcda394fd99/maintainability)](https://codeclimate.com/github/ariknny/Bail-Reform-at-Berkeley/maintainability)

 [![Test Coverage](https://api.codeclimate.com/v1/badges/e8e59eb80fcda394fd99/test_coverage)](https://codeclimate.com/github/ariknny/Bail-Reform-at-Berkeley/test_coverage)

 [![Build Status](https://travis-ci.com/ariknny/bail-reform-at-berkeley.svg?branch=master)](https://travis-ci.com/ariknny/bail-reform-at-berkeley.svg?branch=master)

## Setup

## Deployment
After initializing a local Git repository and committing the application code, you can now push the code for your app to deploy on Heroku. Make sure you are in the app's root directory and run ```heroku create```. Your Heroku Git repository should now be set as a remote for your local repository. Use ```git remote -v``` to ensure that the heroku remote is set for the app. 
You can now use ```git push heroku master``` to push the code from your local repository's ```master``` branch to the heroku remote. Running this command will deploy the latest committed version of your code to Heroku. Please visit Heroku's [Deploying with Git] at https://devcenter.heroku.com/articles/git for more information. 
## Login

## Stripe
Bail Reform at Berkeley uses the Stripe gem to process payments.  Stripe is currently set up for testing use only.  You can use the test card number of `4242 4242 4242 4242` and any 3 digit pin, 5 digit zip, valid email, and expriation date for development.  You can also visit the [Stripe documentation](https://stripe.com/docs/api) for more information on testing values.  Once a customer enters their card information and presses the pay button, Stipe will generate a token for the transaction.  You can then use the token on the server side to process the payment.  Once the customer is ready, they will need to create an account on Stripe.  You can then change the Stripe configuration here

```
app/views/donate/new.html.erb

...

var handler = StripeCheckout.configure({
  key: 'pk_test_TYooMQauvdEDq54NiTphI7jx',
  image: 'https://stripe.com/img/documentation/checkout/marketplace.png',
  locale: 'auto',
  token: function(token) {
    location.replace("/donate/" + token.id + "/" + amt);
  }
});

...
```

and here

```
app/controllers/donate_controller.rb

...

def create
  Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'
  token = params[:stripeToken]
  amt = params[:amount]
  
  ...
```

from using the test key to using the customer's key.  After making this change Stripe should be set up to start performing real transactions.
