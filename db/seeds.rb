User.destroy_all
dmitry = User.create(email: "dmitry@gmail.com", password: "test", password_confirmation: "test")

alex = User.create(email: "alex@gmail.com", password: "test", password_confirmation: "test")


debbie = User.create(email: "debbie@gmail.com", password: "test", password_confirmation: "test")

bill = User.create(email: "bill@gmail.com", password: "test", password_confirmation: "test")

sean = User.create(email: "sean@gmail.com", password: "test", password_confirmation: "test")

Restaurant.destroy_all
restaurant1 = Restaurant.create(restaurant_name: 'Reds Wine Tavern', hours_open: 16, hours_closed: 23, capacity: 50, url: 'https://resizer.otstatic.com/v2/profiles/legacy/3584.jpg', address: "Toronto", neighbourhood: "Little Italy", price_range: "$$", summary: "Great place to eat", restaurant_url: "google.com", user_id: dmitry.id)

restaurant2 = Restaurant.create(restaurant_name: 'The Restaurant at the Adelaide', hours_open: 19, hours_closed: 24, capacity: 100, url: 'https://resizer.otstatic.com/v2/profiles/legacy/984100.jpg', address: "Toronto", neighbourhood: "Little Italy", price_range: "$$", summary: "Great place to eat", restaurant_url: "google.com", user_id: dmitry.id)

restaurant3 = Restaurant.create(restaurant_name: 'Katana on Bay', hours_open: 18, hours_closed: 23, capacity: 30, url: 'https://resizer.otstatic.com/v2/profiles/legacy/76546.jpg', address: "Toronto", neighbourhood: "Little Italy", price_range: "$$", summary: "Great place to eat", restaurant_url: "google.com", user_id: dmitry.id)

restaurant4 = Restaurant.create(restaurant_name: 'Canoe Restaurant and Bar', hours_open: 12, hours_closed: 24, capacity: 200, url: 'https://resizer.otstatic.com/v2/profiles/legacy/3870.jpg', address: "Toronto", neighbourhood: "Little Italy", price_range: "$$", summary: "Great place to eat", restaurant_url: "google.com", user_id: dmitry.id)

restaurant5 = Restaurant.create(restaurant_name: 'Terroni ADELAIDE', hours_open: 14, hours_closed: 20, capacity: 20, url: 'https://resizer.otstatic.com/v2/profiles/legacy/73816.jpg', address: "Toronto", neighbourhood: "Little Italy", price_range: "$$", summary: "Great place to eat", restaurant_url: "google.com", user_id: dmitry.id)

Reservation.destroy_all
reservations = Reservation.create([
  {email: 'super@nova@gmail.com', restaurant_name: 'Reds Wine Tavern', date: Date.today + rand(30), time: 17, number_of_people: 2, restaurant_id: restaurant1.id, user_id: dmitry.id},

  {email: 'super@nova@gmail.com', restaurant_name: 'Reds Wine Tavern', date: Date.today + rand(30), time: 19, number_of_people: 4, restaurant_id: restaurant1.id, user_id: dmitry.id},

  {email: 'super@nova@gmail.com', restaurant_name: 'Katana on Bay', date: Date.today + rand(30), time: 19, number_of_people: 2, restaurant_id: restaurant3.id, user_id: dmitry.id},

  {email: 'super@nova@gmail.com', restaurant_name: 'Canoe Restaurant and Bar', date: Date.today + rand(30), time: 17, number_of_people: 2, restaurant_id: restaurant4.id, user_id: dmitry.id},

  {email: 'super@nova@gmail.com', restaurant_name: 'Terroni ADELAIDE', date: Date.today + rand(30), time: 19, number_of_people: 2, restaurant_id: restaurant5.id, user_id: dmitry.id}
  ])
