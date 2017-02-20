# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
User.create({:firstname => "toto",
             :lastname => "toto",
             :email => "t@t.com",
             :username => "toto",
             :password => "toto"
})
# User.create({:firstname => "titi",
#              :lastname => "titi",
#              :email => "titi@titi.com",
#              :username => "titi",
#              :password => "titi"
# })
User.create({:firstname => "yeti",
             :lastname => "yeti",
             :email => "y@y.com",
             :username => "yeti",
             :password => "yeti"
})
puts Cowsay.say('Generated 2 users', 'random')


# Category.destroy_all
# Category.create({ title:       "Orchids plants",
#                   description: "All about Orchids"
#                })
# Category.create({ title:       "Watchs",
#                   description: "Collector of watchs"
#                })
# Category.create({ title:       "Minerals",
#                   description: "Minerals from Canada"
#                })
# puts Cowsay.say('Generated 3 categories', 'random')

Topic.destroy_all
5.times do
  Topic.create({title: Faker::Lorem.words(rand(2..10)),
                description: Faker::Hacker.say_something_smart,
                enddate: Faker::Date.between(Date.today, 1.year.from_now),
                enable: true,
                user_id: User.pluck(:id).sample,
                category_id: Category.pluck(:id).sample
               })
end
puts Cowsay.say('Generated 5 topics', 'random')

Post.destroy_all
10.times do
  Post.create({ body: Faker::Lorem.paragraphs,
                replyto: User.pluck(:id).sample,
                user_id:  User.pluck(:id).sample,
                topic_id: Topic.pluck(:id).sample
             })
end
puts Cowsay.say('Generated 10 posts', 'random')


SaleTradeWant.destroy_all
10.times do
  SaleTradeWant.create({
              type_stw:   ["T","S","W"].sample,
              title:  Faker::Lorem.sentence,
              description: Faker::Lorem.paragraph,
              active: true,
              emailbuyer: User.pluck(:email).sample,
              buyer_id: User.pluck(:id).sample,
              feedback: Faker::Lorem.sentence,
              user_id: User.pluck(:id).sample,
              topic_id: Topic.pluck(:id).sample
            })
end
puts Cowsay.say('Generated 10 Sale_trade_want', 'random')
#
#
PrivatePost.destroy_all
10.times do
  PrivatePost.create({
               body: Faker::Lorem.paragraphs,
               privatereplyto: User.pluck(:id).sample,
               emailbuyer: User.pluck(:email).sample,
               user_id: User.pluck(:id).sample,
               sale_trade_want_id: SaleTradeWant.pluck(:id).sample
    })
end
puts Cowsay.say('Generated 10 private_posts', 'random')


ReplyPrivatePost.destroy_all
10.times do
  ReplyPrivatePost.create({
               private_post_id: PrivatePost.pluck(:id).sample
              })
end
puts Cowsay.say('Generated 10 reply_private_posts', 'random')


ReplyPost.destroy_all
10.times do
  ReplyPost.create({
             post_id: Post.pluck(:id).sample
            })
end
puts Cowsay.say('Generated 10 reply_post', 'random')


UserPreference.destroy_all
3.times do
  UserPreference.create({:subscribedtopic =>  Topic.pluck(:id).sample,
                          :user_id        =>   User.pluck(:id).sample
                        })
end
puts Cowsay.say('Generated 3 users preferences', 'random')


# UserProfile.destroy_all
#   UserProfile.create({
#                        :enable     =>           true,
#                        :connected  =>           true,
#                        :location   =>           "Vancouver",
#                        :rating     =>           4,
#                        :lasttopic  =>           Topic.pluck(:id).sample,
#                        :user_id    =>           1
#   })
#   UserProfile.create({
#                         :enable      =>          true,
#                         :connected   =>          true,
#                         :location    =>          "Montreal",
#                         :rating      =>          3,
#                         :lasttopic   =>          Topic.pluck(:id).sample,
#                         :user_id     =>          2
#   })
#   UserProfile.create({
#                         :enable       =>         true,
#                         :connected    =>         false,
#                         :location     =>         "New York",
#                         :rating       =>         5,
#                         :lasttopic    =>         Topic.pluck(:id).sample,
#                         :user_id      =>         3
#   })
# puts Cowsay.say('Generated 3 users profiles', 'random')
