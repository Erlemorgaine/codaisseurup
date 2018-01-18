Category.destroy_all
Event.destroy_all
User.destroy_all

art = Category.create(name: "Art")
music = Category.create(name: "Music")
theatre = Category.create(name: "Theatre")
food = Category.create(name: "Food")

dino = User.create(email: "dino@mainz.com", password: "abcd1234")
erle = User.create(email: "erle@leiden.com", password: "abcd1234")
judit = User.create(email: "judit@barna.com", password: "abcd1234")

event1 = Event.create(name: "Yann Tiersen concert", description: "blabla", location: "Mainz", price: 35, capacity: 100, includes_food: false, includes_drinks: false, starts_at: 30.days.from_now, ends_at: 30.days.from_now, active: true, user: dino)

event2 = Event.create(name: "Food festival", description: "blabla", location: "Leiden", price: 5.5, capacity: 2000, includes_food: true, includes_drinks: true, starts_at: 4.days.from_now, ends_at: 6.days.from_now, active: true, user: erle)

event3 = Event.create(name: "Wildernes festival", description: "blabla", location: "Leiden", price: 12.25, capacity: 1500, includes_food: false, includes_drinks: true, starts_at: 24.days.from_now, ends_at: 28.days.from_now, active: true, user: judit)

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dklg9by0h/image/upload/v1516283787/1280px-Lake_Suwa_in_the_Shinano_province_f0jegu.jpg", event: event1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dklg9by0h/image/upload/v1516283787/1200px-Hiroshige_Full_moon_over_a_mountain_landscape_khh1pa.jpg", event: event2)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dklg9by0h/image/upload/v1516283787/27VANGOGHJP2-superJumbo_zcyrhx.jpg", event: event2)

photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dklg9by0h/image/upload/v1516283788/05df6d97a501ea52cef89a692fbe3635_isxbvr.jpg", event: event3)
photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dklg9by0h/image/upload/v1516283787/016-katsushika-hokusai-theredlist_moegze.jpg", event: event2)
