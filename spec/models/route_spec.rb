require 'rails_helper'

RSpec.describe Route, type: :model do
  describe 'Route creation' do
    it 'has valid name' do
      expect(FactoryBot.build(:route).save).to be_truthy
    end

    it 'has invalid name' do
      route = FactoryBot.create(:route)
      expect(FactoryBot.build(:route, name: "AB", active: false).save).to be_falsey
    end
  end
end