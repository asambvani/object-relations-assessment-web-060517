class Customer

  attr_accessor :first_name, :last_name
  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    Customer.all.find do |customer|
      name == "#{customer.first_name} #{customer.last_name}"
    end
  end

  def self.find_all_by_first_name(first_name)
    Customer.all.select do |customer|
      first_name == customer.first_name
    end
  end

  def self.all_names
    Customer.all.map do |customer|
      customer.full_name
    end
  end

  def add_review(restaurant, content)
    review = Review.new(self, restaurant, content)
    restaurant.reviews << review
  end

end

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

class Review

  attr_accessor :customer, :restaurant, :content
  @@all = []

  def initialize(customer, restaurant, content)
    @customer = customer
    @restaurant = restaurant
    @content = content
    @@all << self
  end

  def self.all
    @@all
  end

end
