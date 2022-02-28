# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding the database..."

puts "Deleting from Genres..."
Genre.delete_all
puts "Done."

puts "Seeding Genres..."

genres = %w[Alternative Alternative\ Rock Punk Blues Bossa\ Nova
            Classical Comedy Dance Drama Disco Dubstep Easy\ Listening
            Electronic Folk Heavy\ Metal Hip\ Hop Jazz Latin Metal Opera Pop
            R&B Rap Reggae Rock Rock\ And\ Roll Sci\ Fi\ &\ Fantasy
            Science\ Fiction Soul Soundtrack Techno TV\ Shows World\ Music
            Instrumental K-pop].sort!

genres.each do |g|
  genre = Genre.new(name: g)
  genre.save!
end

puts "Done."
