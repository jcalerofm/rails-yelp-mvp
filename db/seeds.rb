puts 'Cleaning restaurants...'
Restaurant.destroy_all


puts 'Creating 5 restaurants...'

10.times do
  category = ['chinese', 'italian', 'japanese', 'french', 'belgian']
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: category.sample
  )

  5.times do
    rating = [0, 1, 2, 3, 4, 5]
    content = Faker::Restaurant.review
    review = Review.new(
      content: content,
      rating: rating.sample
    )
    review.restaurant = restaurant
    review.save
  end
end

puts 'Finished!'
