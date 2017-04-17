class Restaurant
  attr_accessor :name

  ALL = []

  def self.all
    ALL
  end

  def self.find_by_name(name)
    self.all.find do |restaurant|
      restaurant.name == name
    end
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def reviews
    Review.all.select do |review|
      review.restaurant == self
    end
  end

  def customers
    reviews.collect do |review|
      review.customer
    end
  end
end
