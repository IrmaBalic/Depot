# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
Role.delete_all
Role.create!(name: 'User')
Role.create!(name: 'Admin')

Categorie.delete_all
Categorie.create!(name: 'TV i monitori')
Categorie.create!(name: 'Mobiteli i tableti')
Categorie.create!(name: 'Laptopi')

LineItem.delete_all
Product.delete_all
Product.create!(title: 'Samsung Galaxy Tab 3 7.0 (T211)',
  description: 
    'Uz GALAXY Tab 3 cijeli vam je jedan novi svijet nadohvat ruke. Tanji, uzi i s tanjim okvirom, ovaj novi i poboljsani 
    Tab model nudi nevjerojatnu lakocu drzanja za lakse rukovanje u pokretu. Usto je i laksi, iako to ne umanjuje njegove 
    performance. Zapravo, Tab posjeduje mocni dvojezgreni procesor i dvije kamere. Takodjer cete uzivati u vise aplikacija tvrtki
     Samsung i Google te u besplatnoj Dropbox pohrani velicine 50 GB. Jednostavno ne moze biti bolje od toga!',
  image_url:   'samsung_galaxy_tab.jpg',
  #categorie_id_id: 2,    
  price: 330.00)
