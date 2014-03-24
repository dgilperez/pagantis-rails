require "pagantis-rails/helper"

describe Pagantis::Rails::Helper do
  let(:valid_arguments) {
    { order_id: 'ABCD',
      amount: '1299',
      currency: "EUR",
      description: "One euro item",
      ok_url: "http://example.com/ok",
      nok_url: "http://example.com/nok",
      account_id: '1234'
    }
  }
  let(:invalid_arguments) {
    valid_arguments.reject { |k,v| k == :amount }
  }

  context "initialization" do
    it "should take a few mandatory params on initialization" do
      expect {
        Pagantis::Rails::Helper.new(valid_arguments)
      }.not_to raise_error
    end

    it "should take a few mandatory params on initialization" do
      expect {
        Pagantis::Rails::Helper.new(invalid_arguments)
      }.to raise_error
    end

    it "should take a few mandatory params on initialization" do
      expect {
        Pagantis::Rails::Helper.new(valid_arguments.merge(currency: "YEN"))
      }.to raise_error ArgumentError
    end
  end

  it "should calculate a signature" do
    helper = Pagantis::Rails::Helper.new(valid_arguments)
    helper.signature.should == 'db698919260d01ad2e78d1274c041bd97c23cbb8'
  end
end
