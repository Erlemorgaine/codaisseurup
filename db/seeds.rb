Category.destroy_all
Event.destroy_all
User.destroy_all

# art = Category.create(name: "Art")
# music = Category.create(name: "Music")
# theatre = Category.create(name: "Theatre")
# food = Category.create(name: "Food")

dino = User.create(email: "dino@mainz.com", password: "abcd1234")
erle = User.create(email: "erle@leiden.com", password: "abcd1234")
#judit = User.create(email: "judit@barna.com", password: "abcd1234")

Event.create(name: "Yann Tiersen concert", description: "blabla", location: "Mainz", price: 35, capacity: 100, includes_food: false, includes_drinks: false, starts_at: 30.days.from_now, ends_at: 30.days.from_now, active: true, user: dino)

Event.create(name: "Food festival", description: "blabla", location: "Leiden", price: 5.5, capacity: 2000, includes_food: true, includes_drinks: true, starts_at: 4.days.from_now, ends_at: 6.days.from_now, active: true, user: erle)

#Event.create(name: "Wildernes festival", description: "blabla", location: "Leiden", price: 12.25, capacity: 1500, includes_food: false, includes_drinks: true, starts_at: 24.days.from_now, ends_at: 28.days.from_now, active: true, user: judit)
