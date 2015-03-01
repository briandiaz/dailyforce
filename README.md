# Dailyforce

[![Code Climate](https://codeclimate.com/github/briandiaz/dailyforce/badges/gpa.svg)](https://codeclimate.com/github/briandiaz/dailyforce)

Dailyforce is a simple web app that implements Salesforce REST api using Restforce and Omniauth-Salesforce. The purpose is to show how simple Salesforce can be integrated with Ruby on Rails using their REST api.

## Gems included:

* [Restforce](https://github.com/ejholmes/restforce)
* [AdminLTE](https://github.com/almasaeed2010/AdminLTE)
* [Omniauth Salesforce](https://github.com/realdoug/omniauth-salesforce)

## Quick Start

Clone the repo

	$ git clone https://github.com/briandiaz/dailyforce.git

Install dependencies:

    $ bundle

### Initialization

Keep in mind what the Restforce documentation says: 

'Which authentication method you use really depends on your use case. If you're
building an application where many users from different orgs are authenticated
through oauth and you need to interact with data in their org on their behalf,
you should use the OAuth token authentication method.

If you're using the gem to interact with a single org (maybe you're building some
salesforce integration internally?) then you should use the username/password
authentication method.'

Be sure to create a Connected App at Salesforce:

* Setup
* Create
* Apps
* Connected Apps > New

Get the Consumer Key and Consumer Secret and place them into your environment variables (or use dotfiles, figaro or other gem to store these keys) and
save them as SALESFORCE_CLIENT_ID and SALESFORCE_CLIENT_SECRET.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request