require 'pry'

class Owner

  attr_accessor :pets, :name
  attr_reader :species

  @@all = []
  @@owner_count = 0

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
    @@owner_count += 1
  end

  def self.all
    @@all
  end

  def self.count
    @@owner_count
  end

  def self.reset_all
    self.all.clear
    @@owner_count = 0
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.map do |type, pet_array|
      pet_array.map do |pet|
        pet.mood = "nervous"
      end
    end
    self.pets = {fishes: [], cats: [], dogs: []}
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end


end

#Pry.start
