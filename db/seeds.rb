# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting database..."

Genre.delete_all
puts "Deleted Genre"

Attendance.delete_all
puts "Deleted Attendance"

Event.delete_all
puts "Deleted Event"

Review.delete_all
puts "Deleted Review"

Follow.delete_all
puts "Deleted Follow"

Comment.delete_all
puts "Deleted Comments"

User.delete_all
puts "Deleted Users"

puts "Seeding database"

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

# <--------------------USERS-------------------->

user1 = User.new(email: "abhijeet@email.com", password: "abhijeet@email.com", first_name: "Abhijeet", last_name: "Clay", bio: "Esse eu nulla sunt tempor.", user_name: "abhijeet_clay")
# downloaded_image = URI.open("#")
# user1.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user1.save!

user2 = User.new(email: "nyah@email.com", password: "nyah@email.com", first_name: "Nyah", last_name: "Schmeling", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "nyah_schmeling")
# downloaded_image = URI.open("#")
# user2.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user2.save!

user3 = User.new(email: "boris_knezevic@email.com", password: "boris_knezevic@email.com", first_name: "Boris", last_name: "Knezevic", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "boris_knezevic")
# downloaded_image = URI.open("#")
# user3.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user3.save!

user4 = User.new(email: "marcel_fonseca@email.com", password: "marcel_fonseca@email.com", first_name: "Marcel", last_name: "Fonseca", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "marcel_fonseca")
# downloaded_image = URI.open("#")
# user4.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user4.save!

user5 = User.new(email: "lu_padillas@email.com", password: "lu_padillas@email.com", first_name: "Lu", last_name: "Padillas", bio: "Esse eu nulla sunt tempor elit ut ut ut laboris nostrud.", user_name: "lu_padillas")
# downloaded_image = URI.open("#")
# user5.photo.attach(io: downloaded_image, filename: '#.png', content_type: 'image/png')
user5.save!

puts "Successfully created the Users."

# <--------------------EVENTS-------------------->

event1 = Event.new(title: "BBQ @park", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_knezevic"), genre: Genre.find_by(name: "Alternative"))
event1.save!

event2 = Event.new(title: "Beach Party", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_knezevic"), genre: Genre.find_by(name: "Rock"))
event2.save!

event3 = Event.new(title: "Tea Party", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "marcel_fonseca"), genre: Genre.find_by(name: "Classical"))
event3.save!

event4 = Event.new(title: "Rap Party", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "nyah_schmeling"), genre: Genre.find_by(name: "Rap"))
event4.save!

event5 = Event.new(title: "Philanthropic consert for the Ukranian people", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_knezevic"), genre: Genre.find_by(name: "Folk"))
event5.save!

puts "Successfully created the Events."

# <--------------------ATTENDANCES-------------------->

attendance1 = Attendance.new(user: User.find_by(user_name: "abhijeet_clay"), event: Event.find_by(title: "BBQ @park"))
attendance1.save!

attendance2 = Attendance.new(user: User.find_by(user_name: "nyah_schmeling"), event: Event.find_by(title: "BBQ @park"))
attendance2.save!

attendance3 = Attendance.new(user: User.find_by(user_name: "boris_knezevic"), event: Event.find_by(title: "Beach Party"))
attendance3.save!

attendance4 = Attendance.new(user: User.find_by(user_name: "marcel_fonseca"), event: Event.find_by(title: "Rap Party"))
attendance4.save!

attendance5 = Attendance.new(user: User.find_by(user_name: "lu_padillas"), event: Event.find_by(title: "Tea Party"))
attendance5.save!

puts "Successfully created the Attendances."

# <--------------------REVIEWS-------------------->

review1 = Review.new(comment: "Reprehenderit cillum non non Lorem ONE.", score: 4, reviewer: User.find_by(user_name: "abhijeet_clay"), artist: User.find_by(user_name: "boris_knezevic"))
review1.save!

review2 = Review.new(comment: "He's really nice to hear :).", score: 5, reviewer: User.find_by(user_name: "boris_knezevic"), artist: User.find_by(user_name: "marcel_fonseca"))
review2.save!

review3 = Review.new(comment: "Reprehenderit cillum non non Lorem THREE.", score: 2, reviewer: User.find_by(user_name: "lu_padillas"), artist: User.find_by(user_name: "boris_knezevic"))
review3.save!

review4 = Review.new(comment: "Reprehenderit cillum non non Lorem FOUR.", score: 4, reviewer: User.find_by(user_name: "nyah_schmeling"), artist: User.find_by(user_name: "marcel_fonseca"))
review4.save!

review5 = Review.new(comment: "He's SHIT! >:c", score: 1, reviewer: User.find_by(user_name: "marcel_fonseca"), artist: User.find_by(user_name: "boris_knezevic"))
review5.save!

puts "Successfully created the Reviews."

# <--------------------FOLLOWS-------------------->

follow1 = Follow.new(follower: User.find_by(user_name: "abhijeet_clay"), artist: User.find_by(user_name: "boris_knezevic"))
follow1.save!

follow2 = Follow.new(follower: User.find_by(user_name: "boris_knezevic"), artist: User.find_by(user_name: "marcel_fonseca"))
follow2.save!

follow3 = Follow.new(follower: User.find_by(user_name: "lu_padillas"), artist: User.find_by(user_name: "boris_knezevic"))
follow3.save!

follow4 = Follow.new(follower: User.find_by(user_name: "nyah_schmeling"), artist: User.find_by(user_name: "boris_knezevic"))
follow4.save!

follow5 = Follow.new(follower: User.find_by(user_name: "marcel_fonseca"), artist: User.find_by(user_name: "boris_knezevic"))
follow5.save!

puts "Successfully created the Follows."

# <--------------------COMMENTS-------------------->

comment1 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "abhijeet_clay"), event: Event.find_by(title: "Tea Party"))
comment1.save!

comment2 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "boris_knezevic"), event: Event.find_by(title: "BBQ @park"))
comment2.save!

comment3 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "lu_padillas"), event: Event.find_by(title: "Rap Party"))
comment3.save!

comment4 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "nyah_schmeling"), event: Event.find_by(title: "BBQ @park"))
comment4.save!

comment5 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "marcel_fonseca"), event: Event.find_by(title: "BBQ @park"))
comment5.save!

puts "Successfully created the Comments."
