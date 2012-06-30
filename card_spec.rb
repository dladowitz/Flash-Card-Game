require 'rspec'
require './card.rb'


describe 'Card Class' do

  before (:each) do
    @card = Card.new("Ruby", "A programming language")
  end

  it "should initialize a card object" do
    @card.should be_an_instance_of Card
  end

  it "contains a definition" do
    @card.show_def.index("A programming language").should_not be_nil
  end

  it "You can't cheat on the definition" do
    @card = Card.new("Array", "A collection of items")
    @card.show_def.index("A collection of items").should_not be_nil
  end

  it "contains a term" do
       @card.show_term.index("Ruby").should_not be_nil
      end

  it "should show that the user has not answered correctly upon initialization" do
    @card.correct?.should_not equal true
  end
  it "should be able to show that a user has answered correctly" do
    @card.correct!
    @card.correct?.should equal true
  end



end

