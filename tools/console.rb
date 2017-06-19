require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

customer_1 = Customer.new("Alex", "Sambvani")
customer_2 = Customer.new("Random", "Customer")
eleven_madison = Restaurant.new("Eleven Madison")
shack = Restaurant.new("Shake Shack")
customer_1.add_review(eleven_madison, "This was expensive AF!")
customer_2.add_review(shack, "Delicious but unhealthy!")


Pry.start
