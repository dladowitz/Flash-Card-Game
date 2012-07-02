require 'rspec'
require './deck.rb'
require './card.rb'


describe 'Deck Class' do
  before (:each) do
    @deck = Deck.new('dictionary.txt')
  end

  it "should initialize a deck" do
    @deck.should be_an_instance_of Deck
  end

  it "should be able to create a deck of cards from a dictionary file and show the definition of the first card" do
    @deck.show_card_set[0].show_def.should match /(To create a second name for the variable or method)/
  end

  it "should be able to create a deck of cards from a dictionary file and show the term of the first card" do
     @deck.show_card_set[0].show_term.should match /(alias)/
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
    @deck.set_current_card.show_def.should match /(To create a second name for the variable or method)/
    @deck.set_current_card.show_def.should match /(A command that appends two or more objects together.)/
    @deck.set_current_card.show_def.should match /(Designates code that must be run unconditionally at the beginning of the program before any other.)/
  end

  # it "should return the Term of the 2nd card in the deck" do
  #     @deck.play_next_card.should match /(A command that appends two or more objects together.)/
  #   end
  #    it "should return the Term of the 3rd card in the deck" do
  #     @deck.play_next_card.should match /(Designates code that must be run unconditionally at the beginning of the program before any other.)/
  #   end


end

describe '#guess' do

 before (:all) do
    @deck = Deck.new('dictionary.txt')
    @deck.set_current_card
 end

 it "should test a guess against the term of the 1st card" do
   @deck.guess('alias').should match /(Correct!)/
 end

 it "should test a guess against the term of the 2nd card" do
   @deck.guess('and').should match /(Correct!)/
 end

 it "should test a guess against the term of the 3rd card" do
   @deck.guess('nothing').should match /(Wrong!)/
 end

 it "should tests a guess against the term of the 3rd card" do
   @deck.guess('BEGIN').should match /(Correct!)/
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

