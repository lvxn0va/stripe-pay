#Payments

Payments is a little app for accepting payments online via [Stripe](http://stripe.com/).

Payments is a personal project.

Payments is a work in progress.

![Payments screenshot](https://github.com/jordanstephens/payments/raw/master/doc/screenshot.png)

## Setup

There are a few values that you will have to set directly in the code to get up and running.

### Stripe API Keys

To get set up, register for an account with [Stripe](http://stripe.com/), and grab a set of API keys from your Stripe accounts page.

Open `/config/initializers/stripe_keys.rb` and replace the placeholder values with your actual API keys.

	Stripe.api_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	STRIPE_PUBLIC_KEY = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	
### Authentication Credentials

Next open up `/config/initializers/auth.rb` and replace the default values with your own. These values are used to apply basic HTTP authentication to password protect the payments index at `/payments`.

	BASIC_AUTH_USER = "admin"
	BASIC_AUTH_PASSWORD = "secret"
