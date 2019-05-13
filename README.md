# Bail-Reform-at-Berkeley
http://bail-reform-at-berkeley.herokuapp.com/

 [![Maintainability](https://api.codeclimate.com/v1/badges/e8e59eb80fcda394fd99/maintainability)](https://codeclimate.com/github/ariknny/Bail-Reform-at-Berkeley/maintainability)

 [![Test Coverage](https://api.codeclimate.com/v1/badges/e8e59eb80fcda394fd99/test_coverage)](https://codeclimate.com/github/ariknny/Bail-Reform-at-Berkeley/test_coverage)

 [![Build Status](https://travis-ci.com/ariknny/bail-reform-at-berkeley.svg?branch=master)](https://travis-ci.com/ariknny/bail-reform-at-berkeley.svg?branch=master)

## Setup
In order to get the app running locally, you need to have Ruby version `2.5.3` installed. Run `bundle install -- without production` to install all the required gems. Follow this with `rake db:setup` to initialize the database. `rails server` (or `bundle exec rails server`) starts the application locally and should be enough to run the app.

Currently we don't have any keys or secrets stored in the repo, but we setup the infrastructure to house the secrets for when they are needed in the future. In order to decrypt `config/application.yml.asc` the following command must be run.
```
export KEY=your-secret-key-value 
gpg --passphrase "$KEY" --decrypt \
--output config/application.yml config/application.yml.asc
```
`your-secret-key-value` should be filled in with the value of the KEY environment variable in Travis CI. 
Whenever a variable must be added to `config/application.yml`, then run this command and commit the changes to `config/application.yml.asc` into version control.
```
export KEY=your-secret-key-value gpg --passphrase "$KEY" \
--encrypt --symmetric --armor \
--output config/application.yml.asc config/application.yml
```

If developing on Heroku, whenever a change is made to `config/application.yml` run this command to keep Heroku updated and in the know.
```
figaro heroku:set -e production -a name-of-heroku-app
```
## Deployment

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
