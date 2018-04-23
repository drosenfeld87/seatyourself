User.destroy_all
dmitry = User.create(first_name: "Dmitry", last_name: "Serbin", email: "dmitry@gmail.com", password: "test", password_confirmation: "test", loyalty_points: 50)

alex = User.create(first_name: "Alex", last_name: "Banuet", email: "alex@gmail.com", password: "test", password_confirmation: "test", loyalty_points: 10)

debbie = User.create(first_name: "Debbie", last_name: "Rosenfeld", email: "debbie@gmail.com", password: "test", password_confirmation: "test", loyalty_points: 20)

bill = User.create(first_name: "Bill", last_name: "Li", email: "bill@gmail.com", password: "test", password_confirmation: "test", loyalty_points: 40)

sean = User.create(first_name: "Sean", last_name: "Learner", email: "sean@gmail.com", password: "test", password_confirmation: "test", loyalty_points: 100)

Restaurant.destroy_all
restaurant1 = Restaurant.create(restaurant_name: 'Reds Wine Tavern', hours_open: 16, hours_closed: 23, capacity: 50, min_size: 2, max_size: 10, url: 'https://resizer.otstatic.com/v2/profiles/legacy/3584.jpg', address: "77 Adelaide St W, Toronto, ON M5H 1P9", neighbourhood: "Financial District", price_range: "$$", summary: "Great place to eat", restaurant_url: "redswinetavern.com", user_id: dmitry.id)

restaurant2 = Restaurant.create(restaurant_name: 'The Restaurant at the Adelaide', hours_open: 19, hours_closed: 24, capacity: 100, min_size: 3, max_size: 8, url: 'https://resizer.otstatic.com/v2/profiles/legacy/984100.jpg', address: "325 Bay St., 31st floor, Toronto, ON M5H 4G3", neighbourhood: "Financial District", price_range: "$$", summary: "Great place to eat", restaurant_url: "adelaidehoteltoronto.com", user_id: dmitry.id)

restaurant3 = Restaurant.create(restaurant_name: 'Katana on Bay', hours_open: 18, hours_closed: 23, capacity: 30, min_size: 2, max_size: 6, url: 'https://resizer.otstatic.com/v2/profiles/legacy/76546.jpg', address: "333 Bay St, Toronto, ON M5H 2R2", neighbourhood: "Financial District", price_range: "$$", summary: "Great place to eat", restaurant_url: "katanaonbay.com", user_id: dmitry.id)

restaurant4 = Restaurant.create(restaurant_name: 'Canoe Restaurant and Bar', hours_open: 12, hours_closed: 24, capacity: 200, min_size: 5, max_size: 10, url: 'https://resizer.otstatic.com/v2/profiles/legacy/3870.jpg', address: "66 Wellington St W, Toronto, ON M5K 1H6", neighbourhood: "Financial District", price_range: "$$", summary: "Great place to eat", restaurant_url: "canoerestaurant.com", user_id: dmitry.id)

restaurant5 = Restaurant.create(restaurant_name: 'Terroni ADELAIDE', hours_open: 14, hours_closed: 20, capacity: 20, min_size: 2, max_size: 10, url: 'https://resizer.otstatic.com/v2/profiles/legacy/73816.jpg', address: "57 Adelaide St E, Toronto, ON M5C 1K6", neighbourhood: "Financial District", price_range: "$$", summary: "Great place to eat", restaurant_url: "terroni.com/terroni-toronto", user_id: dmitry.id)


Reservation.destroy_all
reservations = Reservation.create([
  {email: 'super@nova@gmail.com', restaurant_name: 'Reds Wine Tavern', date: Date.today + rand(30), time: 17, number_of_people: 2, restaurant_id: restaurant1.id, user_id: dmitry.id},

  {email: 'super@nova@gmail.com', restaurant_name: 'Reds Wine Tavern', date: Date.today + rand(30), time: 19, number_of_people: 4, restaurant_id: restaurant1.id, user_id: sean.id},

  {email: 'super@nova@gmail.com', restaurant_name: 'Katana on Bay', date: Date.today + rand(30), time: 19, number_of_people: 2, restaurant_id: restaurant3.id, user_id: bill.id},

  {email: 'super@nova@gmail.com', restaurant_name: 'Canoe Restaurant and Bar', date: Date.today + rand(30), time: 17, number_of_people: 2, restaurant_id: restaurant4.id, user_id: debbie.id},

  {email: 'super@nova@gmail.com', restaurant_name: 'Terroni ADELAIDE', date: Date.today + rand(30), time: 19, number_of_people: 2, restaurant_id: restaurant5.id, user_id: alex.id},
])
