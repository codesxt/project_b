namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    make_users
    make_books
    make_friendships
    make_genres
  end
end

def make_users
  User.create!(name: "Bruno Faúndez Valenzuela",
                 email: "gameover_sxt_nah@hotmail.com",
                 password: "password")
  User.create!(name: "William Shakespeare",
                 email: "will@hotmail.com",
                 password: "password")
  30.times do |n|
    name = Faker::Name.name
    email = Faker::Internet.email
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password)
  end
end

def make_books
  users = User.all()
  10.times do
    title = Faker::Lorem.sentence(3)
    author = Faker::Name.name
    genre = rand(28)
    description = Faker::Lorem.sentence(20)
    users.each { |user| user.books.create!(title: title, author: author, genre: genre, description: description) }
  end
end

def make_friendships
  users = User.all
  5.times do
    users.each { |user| user.friendships.create!(friend_id: rand(30)+1 , status: 1) }
  end
end

def make_genres
  Genre.create!(name: "Otro")
  Genre.create!(name: "Antología")
  Genre.create!(name: "Arte")
  Genre.create!(name: "Autoayuda")
  Genre.create!(name: "Biografía")
  Genre.create!(name: "Ciencia")
  Genre.create!(name: "Ciencia Ficción")
  Genre.create!(name: "Cómic")
  Genre.create!(name: "Diario")
  Genre.create!(name: "Diccionario")
  Genre.create!(name: "Drama")
  Genre.create!(name: "Enciclopedia")
  Genre.create!(name: "Fantasía")
  Genre.create!(name: "Guía")
  Genre.create!(name: "Historia")
  Genre.create!(name: "Horror")
  Genre.create!(name: "Humanidades")
  Genre.create!(name: "Infantil")
  Genre.create!(name: "Libro de Cocina")
  Genre.create!(name: "Matemática")
  Genre.create!(name: "Misterio")
  Genre.create!(name: "Poesía")
  Genre.create!(name: "Religioso")
  Genre.create!(name: "Revista")
  Genre.create!(name: "Romance")
  Genre.create!(name: "Sátira")
  Genre.create!(name: "Serie")
  Genre.create!(name: "Viaje")
end
