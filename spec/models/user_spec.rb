require 'rails_helper'

describe User do
  describe "validations" do
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:email)    }
      it { should validate_presence_of(:company) }
      it { should validate_presence_of(:address1) }
      it { should validate_presence_of(:city)     }
      it { should validate_presence_of(:state)    }
      it { should validate_presence_of(:zip)      }
  end

  describe "relationships" do
    it "has many orders" do
    user = build(:user)

    expect(user).to respond_to(:orders)
    end
  end
end
