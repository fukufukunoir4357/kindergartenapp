# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "テストユーザ",
              password: 'test1234',
              password_confirmation: 'test1234',
              admin: false)

EntryTopic.create!(term: '10月1日〜10月15日',
                    reception_day: '11月1日',
                    information: 'ご不明な点はまずお問い合わせフォームよりご質問ください')