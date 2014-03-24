module Pagantis
  module Rails
    # Using this helper you can easily create a form of any flavour in Railsy
    # environments. In the example we are using Rails and HAML
    #
    # Example:
    #
    #   - helper = Pagantis::Helper.new(args ...)
    #   = form_for helper, url: "https://psp.pagantis.com/2/sale", method: "post" do |f|
    #     = f.hidden_field :operation
    #     = f.hidden_field :account_id
    #     = f.hidden_field :signature
    #     = f.text_field :order_id
    #     = f.text_field :auth_method
    #     = f.text_field :amount
    #     = f.text_field :currency
    #     = f.text_field :description
    #     = f.text_field :ok_url
    #     = f.text_field :nok_url
    #     = f.submit 'Pay'
    class Helper
      attr_reader :operation, :order_id, :auth_method, :amount, :currency, :description,
        :ok_url, :nok_url, :account_id, :signature

      def initialize(args = {})
        @operation    = args.fetch(:operation) { nil } # empty operation equals single charge
        @order_id     = args.fetch(:order_id)
        @amount       = args.fetch(:amount)
        @currency     = parse_currency args.fetch(:currency)
        @description  = args.fetch(:description) { "" }
        @ok_url       = args.fetch(:ok_url)
        @nok_url      = args.fetch(:nok_url)
        @account_id   = args.fetch(:account_id)

        if subscription?
          @plan_id    = args.fetch(:plan_id)
          @user_id    = args.fetch(:user_id)
        end
      end

      def subscription?
        @operation == "SUBSCRIPTION"
      end

      def auth_method
        "SHA1"
      end

      def signature
        str = @account_id + @order_id+ @amount + @currency + auth_method + @ok_url + @nok_url
        Digest::SHA1.hexdigest str
      end

      private

      def parse_currency(currency)
        if %w(EUR USD GBP).include? currency
          currency
        else
          fail ArgumentError
        end
      end
    end
  end
end
