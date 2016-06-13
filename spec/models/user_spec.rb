require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#save" do
    context "when tries to save with no email" do
      it "does not allow to be saved" do
        user_1 = User.new(name: "Tester", email: nil, token: '12345')
        user_2 = User.new(name: "Tester", email: '', token: '12345')

        expect(user_1).to be_invalid
        expect(user_2).to be_invalid
      end
    end

    context "when tries to save with an email" do
      it "allows to be saved" do
        user = User.new(name: 'Tester', email: 'email', token: '12345')

        expect(user).to be_valid
      end
    end

    context "when tries to save with no token" do
      it "does not allow to be saved" do
        user_1 = User.new(name: 'Tester', email: 'email', token: nil)
        user_2 = User.new(name: 'Tester', email: 'email', token: '')

        expect(user_1).to be_invalid
        expect(user_2).to be_invalid
      end
    end

    context "when tries to save with a token" do
      it "allows to be saved" do
        user = User.new(name: 'Tester', email: 'email', token: '12345')

        expect(user).to be_valid
      end
    end
  end
end
