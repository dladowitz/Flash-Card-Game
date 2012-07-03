require 'rspec'
require './maker.rb'

describe Maker do

  before(:each) do
    @maker = Maker.new
  end

  it "should instantiate a new maker" do
    @maker.should be_instance_of Maker
  end

 describe "initialization" do

   before(:each) do
     @maker = Maker.new
   end

   it "should create a new file" do
        File.exist?("new_cards.txt").should be true
    end
  end

    describe "#add_new_card" do

      before(:each) do
        @maker = Maker.new
      end

      it "should add new terms and definitions to the file" do
        @maker.add_new_card("smartphone\tan invention from Steve Jobs\n")
        File.read("new_cards.txt").should include "smartphone\tan invention from Steve Jobs\n"
        File.delete("new_cards.txt")
        # file.should_receive(:write).with("smartphone\tan invention from Steve Jobs\n")
      end
    end
end
