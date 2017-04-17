class Customer
  attr_accessor :first_name, :last_name

  ALL = []

  def self.all
    ALL
  end

  def self.find_by_name(name)
    first_name, last_name = name.split
    self.all.each do |customer|
      return customer if customer.first_name == first_name &&
      customer.last_name == last_name
    end
    nil
  end

  def self.find_all_by_first_name(name)
    first_name = name.split.first
    self.all.select do |customer|
      customer.first_name == first_name
    end
  end

  def self.all_names
    self.all.collect do |customer|
      "#{customer.first_name} #{customer.last_name}"
    end
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    self.class.all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_review(restaurant, content)
    Review.new(self, restaurant, content)
  end
end

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

class Review
  attr_reader :customer, :restaurant
  attr_accessor :content # allow for content to be editable

  ALL = []

  def self.all
    ALL
  end

  def initialize(customer, restaurant, content)
    @customer = customer
    @restaurant = restaurant
    @content = content
    self.class.all << self
  end

end
