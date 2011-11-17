# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


american_coins = Coin.create([{name:'penny',value:1},{name:'nickle',value:5},{name:'dime',value:10},{name:'quarter',value:25}])
lalaland_coins = Coin.create([{name:'deuce',value:2},{name:'hexal',value:6}, {name:'lucky', value:7},{name:'omen', value:13}])
CoinSet.create(name: 'lala land', coins: lalaland_coins)
CoinSet.create(name: 'american', coins: american_coins)