class Restaurant
  attr_accessor :name, :reviews

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @reviews = []
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find do |restaurant|
      restaurant.name == name
    end
  end

  def self.customers
    customer_array = self.reviews.map do |review|
      review.customer
    end
    customer_array.uniq
  end
end
