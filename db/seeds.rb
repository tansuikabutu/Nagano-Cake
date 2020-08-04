# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  id: 1,
  email: 'test@user',
  password: 'testtest',
  password_confirmation: 'testtest'
  )

Genre.create!(
 [
	{
  id: 1,
	name: "ケーキ",
	is_status: false
	},
	{
	id: 2,
	name: "プリン",
	is_status: false
	},
  {
  id: 3,
  name: "焼き菓子",
  is_status: false
  },
  {
  id: 4,
  name: "キャンディ",
  is_status: false
  }
 ]
)


Item.create!(
 [
  {
    id: 1,
    genre_id: 1,
    name: "いちごのショートケーキ",
    introduction: "長野県産の苺を使用した当店一押しの商品です",
    price: 1000,
    is_status: 0,
    image: open("./db/images/image1.jpg")
  }
 ]
)

