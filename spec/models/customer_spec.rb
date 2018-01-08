require 'rails_helper'

RSpec.describe Customer, :type => :model do

  describe '.search' do
    before do
      FactoryGirl.create(:customer, name: 'First Record', city: 'New York', state: 'NY', zip: '10001')
      FactoryGirl.create(:customer, name: 'second Record', city: 'Indore', state: 'MP', zip: '452001')
    end
    describe 'should return a valid Customers instance' do
      it { expect(Customer.search({city: 'New York', state: 'NY', zip: '10001'}).count).to eq 1 }
    end
  end
end