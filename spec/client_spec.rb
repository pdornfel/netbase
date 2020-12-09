require 'spec_helper'

describe Netbase::Client do

  before(:all) do
    Netbase.configure do |config|
      config.username = 'xxxx'
      config.password = 'yyyy'
    end
  end

  it 'gets topics' do
    client = Netbase.new
    # response = client.get('topics')
  end
end
