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
end
