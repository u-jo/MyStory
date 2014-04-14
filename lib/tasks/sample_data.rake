namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Foobar",
                         email: "foobar1@gmail.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    admin.build_scrapbook.save
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      userX = User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
      userX.build_scrapbook.save
    end
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.scribbles.create!(content: content) }
    end

    50.times do
      content = Faker::Lorem.sentence(10)
      users.each { |user| user.scrapbook.create_scribble(content).save }
    end
  end
end