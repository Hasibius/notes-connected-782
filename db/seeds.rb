# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding the database..."

puts "Deleting attendances"
Attendance.delete_all
puts "Done."

puts "Deleting from Genres..."
Genre.delete_all
puts "Done."

puts "Seeding Genres..."

puts "Deleting events"
Event.delete_all
puts "Done"

puts "Seeding events"

puts "Deleting users"
User.delete_all
puts "Done"

puts "Seeding users"

genres = %w[Alternative Alternative\ Rock Punk Blues Bossa\ Nova
            Classical Comedy Dance Drama Disco Dubstep Easy\ Listening
            Electronic Folk Heavy\ Metal Hip\ Hop Jazz Latin Metal Opera Pop
            R&B Rap Reggae Rock Rock\ And\ Roll Sci\ Fi\ &\ Fantasy
            Science\ Fiction Soul Soundtrack Techno TV\ Shows World\ Music
            Instrumental K-pop].sort.uniq

genres.each do |g|
  genre = Genre.new(name: g)
  genre.save!
end
puts "Done."

# <------------- USERS-------------------->

user1 = User.new(email: "one@email.com", password: "one@email.com", first_name: "user", last_name: "one", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "one")
# downloaded_image = URI.open("#")
# user1.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user1.save!

user2 = User.new(email: "two@email.com", password: "two@email.com", first_name: "user", last_name: "two", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "two")
# downloaded_image = URI.open("#")
# user2.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user2.save!

user3 = User.new(email: "three@email.com", password: "three@email.com", first_name: "user", last_name: "three", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "three")
# downloaded_image = URI.open("#")
# user3.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user3.save!

user4 = User.new(email: "four@email.com", password: "four@email.com", first_name: "user", last_name: "four", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "four")
# downloaded_image = URI.open("#")
# user4.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user4.save!

user5 = User.new(email: "five@email.com", password: "five@email.com", first_name: "user", last_name: "five", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "five")
# downloaded_image = URI.open("#")
# user5.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user5.save!

puts "Done."

# <------------- EVENTS-------------------->

event1 = Event.new(title: "event-one", date: Date.new, details: "Est ullamco pariatur quis ipsum.", genre: Genre.find_by(name: "Alternative"))
event1.save!

event2 = Event.new(title: "event-two", date: Date.new, details: "Est ullamco pariatur quis ipsum.", genre: Genre.find_by(name: "Classical"))
event2.save!

event3 = Event.new(title: "event-three", date: Date.new, details: "Est ullamco pariatur quis ipsum.", genre: Genre.find_by(name: "Rock"))
event3.save!

event4 = Event.new(title: "event-four", date: Date.new, details: "Est ullamco pariatur quis ipsum.", genre: Genre.find_by(name: "Rap"))
event4.save!

event5 = Event.new(title: "event-five", date: Date.new, details: "Est ullamco pariatur quis ipsum.", genre: Genre.find_by(name: "Blues"))
event5.save!

puts "Done."

# <------------- ATTENDANCES-------------------->

attendance1 = Attendance.new(user_id: 1, event_id: 5)
attendance1.save!

attendance2 = Attendance.new(user_id: 2, event_id: 4)
attendance2.save!

attendance3 = Attendance.new(user_id: 3, event_id: 3)
attendance3.save!

attendance4 = Attendance.new(user_id: 4, event_id: 2)
attendance4.save!

attendance5 = Attendance.new(user_id: 5, event_id: 1)
attendance5.save!

puts "Done."
