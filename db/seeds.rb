# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Topic.create(title: 'Oba Flip',
             body: "There Once was a guy Obafemi, he's the opposite of Steve Buscemi. When he flips through the air, with no thought and no care, he makes his opponents feel phlegmy.")

Topic.create(title: 'Jurgen Klinsmann',
             body: "'I hate that soccer is getting better in America, because I'd rather the players get better in Europe and make our national team better. #nobias' ~ Jurgen 'J.K.' Klinsmann")

User.create(email: 'scomo@example.com',
            encrypted_password: User.new.send(:password_digest, 'password'))

15.times do
  Topic.create(title: Faker::Lorem.words(4), body: Faker::Lorem.paragraphs(3))
end

15.times do
  User.create(email: Faker::Internet.safe_email,
              encrypted_password: User.new.send(:password_digest, 'password'))
end
