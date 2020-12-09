require 'spec_helper'

describe Netbase do
  it 'accepts configuration' do
    Netbase.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
    expect(Netbase.configuration.username).to eq('foo')
    expect(Netbase.configuration.password).to eq('bar')
  end

  it 'has a client' do
    client = Netbase.new
    expect(client).to be_a_kind_of(Netbase::Client)
  end

end
