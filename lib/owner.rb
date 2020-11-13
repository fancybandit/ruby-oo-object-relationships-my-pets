
class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    self.class.all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  # pets that "belong to" an owner

  # all pets

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.collect do |pet|
      pet.owner = nil
      pet.mood = 'nervous'
    end
  end

  # cats

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def feed_cats
    self.cats.collect {|cat| cat.mood = 'happy'}
  end

  # dogs

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.collect {|dog| dog.mood = 'happy'}
  end
end

