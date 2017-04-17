class Restaurant
  attr_accessor :name

  ALL = []

  def self.all
    ALL
  end

  def self.find_by_name(name)
    self.all.each do |restaurant|
      return restaurant if restaurant.name == name
    end
    nil
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
