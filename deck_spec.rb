require 'rspec'
require './deck.rb'
require './card.rb'


describe Deck do
 describe "Initialize" do
  before (:each) do
    @deck = Deck.new('dictionary.txt')
  end

  it "should initialize a deck" do
    @deck.should be_an_instance_of Deck
  end

  it "should be able to create a deck of cards from a dictionary file and show the definition of the first card" do
    @deck.show_card_set[0].definition.should match /(To create a second name for the variable or method)/
  end

  it "should be able to create a deck of cards from a dictionary file and show the term of the first card" do
     @deck.show_card_set[0].term.should match /(alias)/
  end
 end


  describe '#set_current_card' do
     before (:each) do
       @deck = Deck.new('dictionary.txt')
     end

     it "should return flashcard" do
        @deck.set_current_card.should be_instance_of Card
     end

     it "should return the current card to play" do
       @deck.set_current_card.definition.should match /(To create a second name for the variable or method)/
       @deck.set_current_card.definition.should match /(A command that appends two or more objects together.)/
       @deck.set_current_card.definition.should match /(Designates code that must be run unconditionally at the beginning of the program before any other.)/
     end
   end


   describe '#guess' do

    before (:all) do
       @deck = Deck.new('dictionary.txt')
       @deck.set_current_card
    end

    it "should test a guess against the term of the 1st card" do
     STDOUT.should_receive(:puts).with("Correct!")
     STDOUT.should_receive(:puts)
     @deck.guess('alias')
    end

    it "should test a guess against the term of the 2nd card" do
      STDOUT.should_receive(:puts).with("Correct!")
      STDOUT.should_receive(:puts)
      @deck.guess('and')
    end

    it "should test a guess against the term of the 3rd card" do
      STDOUT.should_receive(:puts).with("Wrong! Try again!")
      STDOUT.should_receive(:puts)
      @deck.guess('nothing')
    end

    it "should tests a guess against the term of the 3rd card" do
      STDOUT.should_receive(:puts).with("Correct!")
       STDOUT.should_receive(:puts)
       @deck.guess('BEGIN')
    end
  end



end









  #  it "should check if term giving by user matches definition in current card" do
  #    @deck.set_current_card
  #    @deck.guess("alias").should match /(To create a second name for the variable or method)/
  #  end
  #
  #  it "should check if term giving by user matches definition in current card" do
  #    @deck.set_current_card
  #    @deck.set_current_card
  #    @deck.guess("and").should match /(A command that appends two or more objects together.)/
  #  end

  # it "should check if user inputs the right term" do
  #     @deck.set_current_card
  #     @deck.set_current_card
  #     @deck.set_current_card
  #
  #   end

