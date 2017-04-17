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
