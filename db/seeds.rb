# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative 'users'

# p Users::USERS.size

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

puts 'Seeding 102 users...'

# bots 😅
Users::USERS.each do |usr|
  # puts "|#{usr[:first_name]}|"
  u = User.new(email: usr[:email], password: usr[:password], first_name: usr[:first_name], last_name: usr[:last_name],
    user_name: usr[:user_name])
  u.save!
end

# User
user = User.new(email: "hasib@email.it", password: "hasib@email.it", first_name: "Hasib", last_name: "Selimovic", user_name: "hasib_s")
url = "https://res.cloudinary.com/dibsi5ltn/image/upload/v1646664977/development/avatars/hasib-01_iscaza.jpg"
file = URI.open(url)
user.photo.attach(io: file, filename: 'hasib-01_iscaza.jpg', content_type: 'image/png')
user.save!
puts "|#{url}| ✅"

# Artist
user = User.new(email: "ddymocke0@email.com", password: "ddymocke0@email.com", first_name: "Daven", last_name: "Dymocke", bio: "Hi! My name is Daven, I come from Italy and I like to play the guitar.", user_name: "daven")
url = "https://res.cloudinary.com/dibsi5ltn/image/upload/v1646668549/development/avatars/daven-01_swzd9d.jpg"
file = URI.open(url)
user.photo.attach(io: file, filename: 'daven-01_swzd9d.jpg', content_type: 'image/png')
user.save!
puts "|#{url}| ✅"

user = User.new(email: "ajacmar14@home.pl", password: "ajacmar14@home.pl", first_name: "Allan", last_name: "Jacmar", bio: "Don't mind me, I am just hosting all the events", user_name: "ajacmar14")
url = "https://res.cloudinary.com/dibsi5ltn/image/upload/v1646668549/development/avatars/daven-01_swzd9d.jpg"
file = URI.open(url)
user.photo.attach(io: file, filename: 'daven-01_swzd9d.jpg', content_type: 'image/png')
user.save!
puts "|#{url}| ✅"

user = User.new(email: "boris_knezevic@email.com", password: "boris_knezevic@email.com", first_name: "Boris", last_name: "Knezevic", bio: "Pianist, Komponist, Web Developer 💻", user_name: "boris_k")
url = "https://res.cloudinary.com/dibsi5ltn/image/upload/v1646908983/development/avatars/boris-k-01_ihlhl2.jpg"
file = URI.open(url)
user.photo.attach(io: file, filename: 'daven-01_swzd9d.jpg', content_type: 'image/png')
user.save!
puts "|#{url}| ✅"

puts "Done seeding Users."

# <--------------------EVENTS-------------------->

puts 'Seeding Events...'
event = Event.new(title: "Guitar Solo", date: "11.03.2022, 18:30", details: "For those who like Instrumental music they can join me and enjoy. Feel free to grab your own drinks! \nSee you there! 😃", user: User.find_by(user_name: "daven"), genre: Genre.find_by(name: "Instrumental"), address: "Heßstraße 132, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646666786/development/events/acoustic-guitar-01_w7pyrr.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "90's Party", date: "18.05.2022, 20:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Disco"), address: "Lenbachplatz 1, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646319268/development/events/90s-01_yfhhlz.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: '90s-01_yfhhlz.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Rock 'n' Roll Party", date: "06.06.2022, 21:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Rock\ And\ Roll"), address: "Dachauer Straße 114, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646319268/development/events/rock-n-roll-01_xotqod.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'rock-n-roll-01_xotqod.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!


event = Event.new(title: "Tram des Balkans", date: "10.06.2022, 20:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Rock"), address: "Einsteinstraße 42, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745993/development/events/tram-des-balkans-01_rj8cdw.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Eksotik Meksotik pres. Mitsune", date: "18.03.2022, 20:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "K-pop"), address: "Dachauer Straße 114, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745949/development/events/eksotik-meksotik-mitsune-01_uzrtbz.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Jaimi Faulkner", date: "02.04.2022, 19:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Soul"), address: "Tumblingerstraße 29, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745950/development/events/jaimi-faulkner-01_wqvzwb.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Three For Silver", date: "26.03.2022, 20:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "daven"), genre: Genre.find_by(name: "Rock"), address: "Zellstraße 4, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745950/development/events/three-for-silver-01_ej3whi.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Buck Roger & The Sidetrackers", date: "16.03.2022, 19:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Reggae"), address: "Feilitzschstr. 12, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745949/development/events/buck-roger-and-the-sidetrackers-01_tnxtmn.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Duo Ambarzumjan", date: "03.04.2022, 15:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Classical"), address: "Hansastraße 39, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745949/development/events/duo-ambarzumjan-01_owpkdw.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Notos Quartett", date: "23.04.2022, 16:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Classical"), address: "Thalkirchnerstraße 10, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745950/development/events/notos-quartett-01_dhijp7.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Me & Reas | kult9", date: "06.04.2022, 19:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "daven"), genre: Genre.find_by(name: "Folk"), address: "Blutenburgstraße 71, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745949/development/events/me-and-reas-01_hwpx7d.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Mega 90er Rave", date: "29.03.2022, 20:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Techno"), address: "Reitknechtstraße 6, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646745949/development/events/90-rave-01_zh8kvh.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Merak", date: "01.04.2022, 16:45", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Folk"), address: "Reitknechtstraße 6, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646907955/development/events/trio-merak-01_tnqie9.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "GIRLS Tanz", date: "30.04.2022, 23:00", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Techno"), address: "Prinzregentenplatz 12, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646754946/development/events/girls-tanz-01_xb169y.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

event = Event.new(title: "Geometric Vision", date: "01.04.2022, 16:45", details: "Est ullamco pariatur quis ipsum.", user: User.find_by(user_name: "boris_k"), genre: Genre.find_by(name: "Rock"), address: "Maximilianstraße 28, München")
url = 'https://res.cloudinary.com/dibsi5ltn/image/upload/v1646754946/development/events/geometric-vision-01_hnx60n.jpg'
file = URI.open(url)
event.photo.attach(io: file, filename: 'acoustic-guitar-01_w7pyrr.jpg', content_type: 'image/jpg')
puts "|#{url}| ✅"
event.save!

puts "Done seeding Events."

# <--------------------ATTENDANCES-------------------->

puts 'Seeding Attendances...'

# Add 57 attendances to the event

event = Event.find_by(title: "Guitar Solo")
User.all.first(57).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Geometric Vision")
User.all.first(46).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "GIRLS Tanz")
User.all.first(23).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Mega 90er Rave")
User.all.first(18).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Me & Reas | kult9")
User.all.first(49).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Notos Quartett")
User.all.first(33).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Duo Ambarzumjan")
User.all.first(12).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Buck Roger & The Sidetrackers")
User.all.first(33).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Three For Silver")
User.all.first(68).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Jaimi Faulkner")
User.all.first(40).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Eksotik Meksotik pres. Mitsune")
User.all.first(27).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Tram des Balkans")
User.all.first(70).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "90's Party")
User.all.first(30).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Rock 'n' Roll Party")
User.all.first(16).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end

event = Event.find_by(title: "Merak")
User.all.first(89).each do |usr|
  # p "user |#{usr.user_name}| will attend to Guitar Solo"
  attendance = Attendance.new(user: usr, event: event)
  attendance.save!
end
puts "Done seeding Attendances."

# <--------------------REVIEWS-------------------->

puts 'Seeding Reviews...'

review = Review.new(comment: "Good vibe!", score: 4, reviewer: User.find_by(user_name: "cstayte1x"), artist: User.find_by(user_name: "daven"))
review.save!

review = Review.new(comment: "He's really nice to hear :).", score: 5, reviewer: User.find_by(user_name: "bdinleyr"), artist: User.find_by(user_name: "daven"))
review.save!

review = Review.new(comment: "Yet another solid performance", score: 5, reviewer: User.find_by(user_name: "bdinleyr"), artist: User.find_by(user_name: "daven"))
review.save!

review = Review.new(comment: "The tempo was too slow for me", score: 2, reviewer: User.find_by(user_name: "dbougent"), artist: User.find_by(user_name: "daven"))
review.save!

review = Review.new(comment: "Relaxing!", score: 4, reviewer: User.find_by(user_name: "mjozefczak12"), artist: User.find_by(user_name: "daven"))
review.save!

review = Review.new(comment: "Nice music, but the duration was too short", score: 3, reviewer: User.find_by(user_name: "merskin1i"), artist: User.find_by(user_name: "daven"))
review.save!

puts "Done seeding Reviews."

# <--------------------FOLLOWS-------------------->

puts 'Seeding Follows...'

artist = User.find_by(user_name: "daven")
User.all.first(31).each do |usr|
  follow = Follow.new(follower: usr, artist: artist)
  follow.save!
end

puts "Done seeding Follows."

# <--------------------COMMENTS-------------------->

puts 'Seeding Comments...'

comment1 = Comment.new(content: "He has some nice reviews", user: User.find_by(user_name: "bhallett2n"), event: Event.find_by(title: "Guitar Solo"))
comment1.save!

comment2 = Comment.new(content: "Cant't wait for this play!", user: User.find_by(user_name: "bdinleyr"), event: Event.find_by(title: "Guitar Solo"))
comment2.save!

comment3 = Comment.new(content: "Does he also sing?", user: User.find_by(user_name: "ebubear2a"), event: Event.find_by(title: "Guitar Solo"))
comment3.save!

comment4 = Comment.new(content: "No, but he is a very good guitar player", user: User.find_by(user_name: "cbramwella"), event: Event.find_by(title: "Guitar Solo"))
comment4.save!

comment5 = Comment.new(content: "He is my favorite!", user: User.find_by(user_name: "ssummersc"), event: Event.find_by(title: "Guitar Solo"))
comment5.save!

puts "Done seeding Comments."

puts "Done seeding database.\n\nFinished!\n\n"
