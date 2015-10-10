# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  {name: 'test_user', email: 'test@test.com', password: '123456789'},
  {name: 'test_user2', email: 'test2@test.com', password: '123456789'},
])


Wallet.create([
  {name: '財布', user_id: 1, price: 5000},
  {name: '銀行', user_id: 1, price: 50000},
  {name: '財布', user_id: 2, price: 5000},
  {name: '銀行', user_id: 2, price: 50000},
])



Category.create([
  {name: '食事', color_id: 1, user_id: 1, wallet_id: 1},
  {name: '衣類', color_id: 2, user_id: 1, wallet_id: 1},
  {name: '食事', color_id: 1, user_id: 2, wallet_id: 3},
  {name: '衣類', color_id: 2, user_id: 2, wallet_id: 3},
])

SubCategory.create([
  {name: 'お菓子',   category_id: 1, user_id: 1, wallet_id:1},
  {name: 'ラーメン', category_id: 1, user_id: 1, wallet_id:1},
  {name: '子供服',   category_id: 2, user_id: 1, wallet_id:2},
  {name: 'お菓子',   category_id: 3, user_id: 2, wallet_id:3},
  {name: 'ラーメン', category_id: 3, user_id: 2, wallet_id:3},
  {name: '子供服',   category_id: 4, user_id: 2, wallet_id:4},
])


ExpenseItem.create([
  {name: 'うまい棒', user_id: 1, category_id: 1, sub_category_id: 1, price: 10, wallet_id:1},
  {name: 'チーズインハンバーグ', user_id: 1, category_id: 1, price: 500},
])

ShortCc.create([
  {user_id: 1, category_id: 1, sub_category_id: 1},
  {user_id: 1, category_id: 1},
])

ShortCp.create([
  {user_id: 1, short_cc_id: 1, price: 100},
  {user_id: 1, short_cc_id: 1, price: 150},
  {user_id: 1, short_cc_id: 2, price: 650},
])

