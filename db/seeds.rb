# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "\nSeeding database...\n\n"

puts "Deleting Comments..."
Comment.delete_all
puts 'Done deleting Comments.'

puts "Deleting Attendances..."
Attendance.delete_all
puts 'Done deleting Attendances.'

puts "Deleting Reviews..."
Review.delete_all
puts 'Done deleting Reviews.'

puts "Deleting Follows..."
Follow.delete_all
puts 'Done deleting Follows.'

puts "Deleting Events..."
Event.delete_all
puts 'Done deleting Events.'

puts "Deleting Genres..."
Genre.delete_all
puts 'Done deleting Genres.'

puts "Deleting Users..."
User.delete_all
puts 'Done deleting Users.'

puts "Seeding Genres..."

genres = %w[Alternative Alternative\ Rock Punk Blues Bossa\ Nova
            Classical Comedy Dance Drama Disco Dubstep Easy\ Listening
            Electronic Folk Heavy\ Metal Hip\ Hop Jazz Latin Metal Opera Pop
            R\ n\ B Rap Reggae Rock Rock\ And\ Roll Sci\ Fi\ and\ Fantasy
            Soul Techno TV\ Shows World\ Music Instrumental K-pop].sort.uniq

puts 'Attaching images to genres...'
images = Cloudinary::Api.resources(type: :upload, max_results: 100, prefix: 'development/genres')['resources']
urls = images.map { |image| image['secure_url'] }

genres.each do |g|
  genre = Genre.new(name: g)
  name = "/#{g.downcase.gsub(/\s/, '-')}-01"
  urls.each do |url|
    next unless url.include?(name)

    puts "|#{url}| ✅"
    # download image
    file = URI.open(url)
    # attach it to the genre
    genre.photo.attach(io: file, filename: "#{name}.jpg", content_type: 'image/jpeg')
  end
  genre.save!
end

puts 'Done attaching images to genres.'
puts "Done seeding Genres."

# <--------------------USERS-------------------->

puts 'Seeding users...'

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

puts "Done seeding Users."

# <--------------------EVENTS-------------------->

# file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts 'Seeding Events...'
event1 = Event.new(title: "BBQ @park", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_knezevic"), genre: Genre.find_by(name: "Alternative"), address: "Heßstraße 132, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646319268/development/events/bbq-01_x1vp4c.jpg'
file = URI.open(url)
event1.photo.attach(io: file, filename: 'bbq-01_x1vp4c.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event1.save!


event2 = Event.new(title: "Beach Party", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_knezevic"), genre: Genre.find_by(name: "Rock"), address: "Balanstraße 73, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646319268/development/events/beach-01_dszaqn.jpg'
file = URI.open(url)
event2.photo.attach(io: file, filename: 'beach-01_dszaqn.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event2.save!

event3 = Event.new(title: "Classical Music Event", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "marcel_fonseca"), genre: Genre.find_by(name: "Classical"), address: "Zellstr 4, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646319268/development/events/classical-01_x3jjmn.jpg'
file = URI.open(url)
event3.photo.attach(io: file, filename: 'classical-01_x3jjmn.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event3.save!

event4 = Event.new(title: "90's Party", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "nyah_schmeling"), genre: Genre.find_by(name: "Disco"), address: "Lenbachplatz 1, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646319268/development/events/90s-01_yfhhlz.jpg'
file = URI.open(url)
event4.photo.attach(io: file, filename: '90s-01_yfhhlz.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event4.save!

event5 = Event.new(title: "Rock 'n' Roll Party", date: Date.new, details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_knezevic"), genre: Genre.find_by(name: "Rock\ And\ Roll"), address: "Dachauer Straße 114, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646319268/development/events/rock-n-roll-01_xotqod.jpg'
file = URI.open(url)
event5.photo.attach(io: file, filename: 'rock-n-roll-01_xotqod.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event5.save!

puts "Done seeding Events."

# <--------------------ATTENDANCES-------------------->

puts 'Seeding Attendances...'

attendance1 = Attendance.new(user: User.find_by(user_name: "abhijeet_clay"), event: Event.find_by(title: "BBQ @park"))
attendance1.save!

attendance2 = Attendance.new(user: User.find_by(user_name: "nyah_schmeling"), event: Event.find_by(title: "BBQ @park"))
attendance2.save!

attendance3 = Attendance.new(user: User.find_by(user_name: "boris_knezevic"), event: Event.find_by(title: "Beach Party"))
attendance3.save!

attendance4 = Attendance.new(user: User.find_by(user_name: "marcel_fonseca"), event: Event.find_by(title: "Classical Music Event"))
attendance4.save!

attendance5 = Attendance.new(user: User.find_by(user_name: "lu_padillas"), event: Event.find_by(title: "90's Party"))
attendance5.save!

puts "Done seeding Attendances."

# <--------------------REVIEWS-------------------->

puts 'Seeding Reviews...'

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

puts "Done seeding Reviews."

# <--------------------FOLLOWS-------------------->

puts 'Seeding Follows...'

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

puts "Done seeding Follows."

# <--------------------COMMENTS-------------------->

puts 'Seeding Comments...'

comment1 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "abhijeet_clay"), event: Event.find_by(title: "BBQ @park"))
comment1.save!

comment2 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "boris_knezevic"), event: Event.find_by(title: "BBQ @park"))
comment2.save!

comment3 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "lu_padillas"), event: Event.find_by(title: "90's Party"))
comment3.save!

comment4 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "nyah_schmeling"), event: Event.find_by(title: "BBQ @park"))
comment4.save!

comment5 = Comment.new(content: "Eiusmod excepteur ofs.", user: User.find_by(user_name: "marcel_fonseca"), event: Event.find_by(title: "BBQ @park"))
comment5.save!

puts "Done seeding Comments."

puts "Done seeding database.\n\nFinished!\n\n"
