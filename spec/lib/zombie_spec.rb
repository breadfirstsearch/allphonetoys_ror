require "spec_helper"
require "zombie"

describe Zombie do
    #examples
    it "is named Ash" do
        zombie = Zombie.new
        zombie.name.should == 'Ash' #expectation
        ##assert_equal 'Ash', zombie.name
    end
    it "has no brains" do
        zombie = Zombie.new
        zombie.brains.should < 1
    end
    it "is hungry" do
        zombie = Zombie.new
        #zombie.hungry?.should == true
        zombie.should be_hungry
    end
    
end