require 'rails_helper'

describe Freelancer, type: :model do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
end
