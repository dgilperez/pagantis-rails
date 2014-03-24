# Pagantis::Rails

Rails wrapper for [pagantis-ruby](http://github.com/pagantis/pagantis-ruby) library.

## Installation

Add this line to your application's Gemfile:

    gem 'pagantis-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pagantis-rails

## Usage

Pagantis::Rails::Helper

Using this helper you can easily create a form of any flavour in Railsy
environments. 

In the example we are using Rails and HAML: 

    - helper = Pagantis::Helper.new(args ...)

    = form_for helper, as: :helper, url: "https://psp.pagantis.com/2/sale", method: "post" do |f|
      = f.hidden_field :operation
      = f.hidden_field :account_id
      = f.hidden_field :signature
      = f.text_field :order_id
      = f.text_field :auth_method
      = f.text_field :amount
      = f.text_field :currency
      = f.text_field :description
      = f.text_field :ok_url
      = f.text_field :nok_url
      = f.submit 'Pay'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
