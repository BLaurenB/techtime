require 'rails_helper'

describe Freelancer do
  before do
    freelancer = Freelancer.create(name:"JoBob Smith", description:"BE Developer", price:100, image: 0)
    #should we add category id's yet? or add to the column in the next userstory?

    it "it has a name" do
      expect(freelancer.name).to eq("JoBob Smith")
    end

    it "it has a description" do
      expect(freelancer.description).to eq("BE Developer")
    end

    it "it has a price" do
      expect(freelancer.price).to eq(100)
    end

    #need to figure out how to do images that are not urls!
    xit "it has a image" do
      expect(freelancer.image).to eq()
    end

    #Not sure if we should do this one yet because the spec doesn't call for it til userstory2
    xit "it has a category " do

    end
  end
end
