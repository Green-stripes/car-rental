Car.destroy_all

20.times do
  car = Car.new(model: ["Honda", "Audi", "Bmw", "Porsche", "Mustang"].sample, price_per_day: rand(50 - 500))
  car.save
  car.photo = "https://source.unsplash.com/featured/?#{car.model}"
  car.save
  puts "Created #{car.id} cars"
end
