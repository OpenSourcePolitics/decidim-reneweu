# OSP App

Citizen Participation and Open Government application.

![Test](https://github.com/OpenSourcePolitics/decidim-reneweu/workflows/Test/badge.svg?branch=master)

This is a base app for all OSP projects. It uses OSP's decidim version.

## Machine translation configuration

Machine translation is configured through the provider [DeepL](https://www.deepl.com) by using the gem https://github.com/wikiti/deepl-rb.

In order to make it work these ENV variables need to be configured:

```
TRANSLATOR_API_KEY=*******
TRANSLATOR_HOST=https://api-free.deepl.com
```

- Obtain the `TRANSLATOR_API_KEY` by creating an account at https://www.deepl.com/pro#developer
- For `TRANSLATOR_HOST`, set it to `https://api-free.deepl.com` if using the "DeeL API Free" plan. If using the "DeepL API Pro", then set it to `https://api.deepl.com`

> Note: you still need to enable machine translation at the organization settings.


## Run tests

A minimal test suite is enable to ensure the app is ready across changes.

To run tests locally run once:

```bash
bundle exec rake test_app
```

Then

```bash
bundle exec rspec spec
```

Rubocop is also configured, for automatic corrections run:

```bash
bundle exec rubocop -a
```


## Deploying the app

* heroku run rake db:migrate
* Set SEED=1 as ENV variable
* heroku run rake db:seed --app osp-decidim
* See (Setting up the application .3)


## Setting up the application

You will need to do some steps before having the app working properly once you've deployed it:

1. Open a Rails console in the server: `bundle exec rails console`
2. Create a System Admin user:
```ruby
user = Decidim::System::Admin.new(email: <email>, password: <password>, password_confirmation: <password>)
user.save!
```
3. Visit `<your app url>/system` and login with your system admin credentials
4. Create a new organization. Check the locales you want to use for that organization, and select a default locale.
5. Set the correct default host for the organization, otherwise the app will not work properly. Note that you need to include any subdomain you might be using.
6. Fill the rest of the form and submit it.

You're good to go!

### How to deploy

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

1. Use the "Deploy to Heroku" button
1. Choose a name for the app, and organization and a tier
1. Fill in the required env vars.
1. Create the app
1. Enable Review Apps for this app (you'll need to create a Pipeline)



## Machine translation configuration

Machine translation is configured through the provider [DeepL](https://www.deepl.com) by using the gem https://github.com/wikiti/deepl-rb.

In order to make it work these ENV variables need to be configured:

```
TRANSLATOR_API_KEY=*******
TRANSLATOR_HOST=https://api-free.deepl.com
```

- Obtain the `TRANSLATOR_API_KEY` by creating an account at https://www.deepl.com/pro#developer
- For `TRANSLATOR_HOST`, set it to `https://api-free.deepl.com` if using the "DeeL API Free" plan. If using the "DeepL API Pro", then set it to `https://api.deepl.com`

> Note: you still need to enable machine translation at the organization settings.
