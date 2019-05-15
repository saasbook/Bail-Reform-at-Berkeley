# Bail-Reform-at-Berkeley
http://bail-reform-at-berkeley.herokuapp.com/

 [![Maintainability](https://api.codeclimate.com/v1/badges/e8e59eb80fcda394fd99/maintainability)](https://codeclimate.com/github/ariknny/Bail-Reform-at-Berkeley/maintainability)

 [![Test Coverage](https://api.codeclimate.com/v1/badges/e8e59eb80fcda394fd99/test_coverage)](https://codeclimate.com/github/ariknny/Bail-Reform-at-Berkeley/test_coverage)

 [![Build Status](https://travis-ci.com/ariknny/bail-reform-at-berkeley.svg?branch=master)](https://travis-ci.com/ariknny/bail-reform-at-berkeley.svg?branch=master)

##New Features Implemented
-Homepage containing statistics on bail and mission statement of Bail Reform at Berkeley
-Users can create an account, log in or log out of site by using "Login"
-Users can donate to the BR@B bail fund, powered by the Stripe API by using "Donate"
-Users can apply for aid from the BR@B bail fund using "Apply for Bail"
-Users can learn about the leadership team of BR@B by using "Meet the Team," users can also learn more about each member by clicking their name which will redirect to their linkedin page

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
After initializing a local Git repository and committing the application code, you can now push the code for your app to deploy on Heroku. Make sure you are in the app's root directory and run ```heroku create```. Your Heroku Git repository should now be set as a remote for your local repository. Use ```git remote -v``` to ensure that the heroku remote is set for the app. 
You can now use ```git push heroku master``` to push the code from your local repository's ```master``` branch to the heroku remote. Running this command will deploy the latest committed version of your code to Heroku. Please visit Heroku's [Deploying with Git](https://devcenter.heroku.com/articles/git) for more information. 

Due to the fact that our client wants the app to be hosted on Berkeley's Open Computing Facility (OCF) domain, the client will first need to create an OCF account. After obtaining the account information, follow the instructions on OCF's [Web Hosting](https://www.ocf.berkeley.edu/docs/services/web/) and [Ruby on Rails](https://www.ocf.berkeley.edu/docs/services/webapps/rails/) pages.

If you just want to host on Heroku, you may need to run the following sequence of steps:
```
heroku restart -a [name]
heroku pg:reset DATABASE -a [name]
heroku run rake db:migrate -a [name]
heroku run rake db:seed -a [name]
```
Replace `[heroku repository name]` with what the app is called on Heroku. This restarts the app, resets the database, and does the relevant migrations and seeding. If you get tired of typing `-a [name]` every time, consider adding a default app (though this may be complicated).

## Login
Bail Reform at Berkeley uses the Devise gem to handle user authentication and sessions. It's currently set up with *just* the basics, allowing users to register, log in, and log out. The default Devise controllers and views are pulled out so you can edit them, under `app/controllers/users` and `app/views/devise`. You should definitely refer to [the Devise documentation](https://github.com/plataformatec/devise) for guidance on editing these files. Also remember that you can always run `rake routes` to see what all the routes and their helpers are.

Currently, the login functionality is not connected to anything else. There are several controller helper functions available from Devise, namely `user_signed_in?`, `current_user`, and `user_session` which will be useful for handling user-specific tasks. Check the documentation for more info.

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
