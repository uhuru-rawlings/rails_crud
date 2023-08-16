10.times do
    Article.create({
        title: Faker::Book.title,
        author: Faker::Book.author,
        body: Faker::Lorem.sentence
    })
end