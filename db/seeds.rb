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
    introduction: "長野県産の苺を贅沢に使用した当店一押しの商品です",
    price: 1000,
    is_status: 0,
    image: open("./db/images/image1.jpg")
  },
  {
    id: 2,
    genre_id: 1,
    name: "抹茶のケーキ",
    introduction: "長野松本茶店さんから取り寄せた抹茶を贅沢に使用。抹茶好きにはたまらない一品です。",
    price: 700,
    is_status: 0,
    image: open("./db/images/image2.jpg")
  },
  {
    id: 3,
    genre_id: 2,
    name: "林檎ぷりん",
    introduction: "長野県産の林檎をそのままプリンの器に。見た目も可愛い一品です。",
    price: 600,
    is_status: 0,
    image: open("./db/images/image3.jpg")
  },
  {
    id: 4,
    genre_id: 3,
    name: "ブルーベリークッキー",
    introduction: "長野県産のブルーベリーを使用したソフトクッキーです。８枚入りでお届けします。コーヒーのお供にぜひ！",
    price: 800,
    is_status: 0,
    image: open("./db/images/image4.jpg")
  },
  {
    id: 5,
    genre_id: 2,
    name: "ティラミス",
    introduction: "長野安曇野牧場の濃厚マスカルポーネチーズを使用。ほろ苦いコーヒーとフレッシュなマスカルポーネのハーモニーを楽しめる一品。",
    price: 500,
    is_status: 0,
    image: open("./db/images/image5.jpg")
  }
 ]
)


 Member.create!(
 [
  {
  id: 1,
  email: '1@1',
  last_name: '例田', last_name_kana: 'レイダ',
  first_name: '一郎',   first_name_kana: 'イチロウ',
  postcode: '1111111',
  address: '北岡県乙西川市馬城寺1-1-1',
  phone_number: '11111111',
  password: '111111',
  password_confirmation: '111111',
  },
  {
  id: 2,
  email: '2@2',
  last_name: '例田', last_name_kana: 'レイダ',
  first_name: '二郎',   first_name_kana: 'ジロウ',
  postcode: '1111111',
  address: '北岡県乙西川市馬城寺1-1-1',
  phone_number: '11111111',
  password: '111111',
  password_confirmation: '111111',
  },
  {
  id: 3,
  email: '3@3',
  last_name: '小野', last_name_kana: 'オノノ',
  first_name: '妹子',   first_name_kana: 'イモコ',
  postcode: '3333333',
  address: '橋都府馬馬市法流寺3-3-3',
  phone_number: '33333333',
  password: '111111',
  password_confirmation: '111111',
  },
  {
  id: 4,
  email: '4@4',
  last_name: 'ソク', last_name_kana: 'ソク',
  first_name: 'ラテス',   first_name_kana: 'ラテス',
  postcode: '4444444',
  address: '東京都練馬区井出阿4-4-4',
  phone_number: '44444444',
  password: '111111',
  password_confirmation: '111111',
  },
  {
  id: 5,
  email: '5@5',
  last_name: '金', last_name_kana: 'キム',
  first_name: '蘭太狗屋',   first_name_kana: 'ラタクヤ',
  postcode: '5555555',
  address: '巣松府具蘭市芽存町5-5-5',
  phone_number: '55555555',
  password: '111111',
  password_confirmation: '111111',
  },
 ]
 )

