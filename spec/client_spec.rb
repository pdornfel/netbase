require 'spec_helper'

describe Netbase::Client do
  it 'gets topics' do

    Netbase.configure do |config|
      config.username = 'paul.dornfeld@mullenlowe.com'
      config.password = 'mullenlowe1!'
    end
    client = Netbase.new
    response = client.get('topics')
  end
end
