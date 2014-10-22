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
    'Uz GALAXY Tab 3 cijeli vam je jedan novi svijet nadohvat ruke. Tanji, uži i s tanjim okvirom, ovaj novi i poboljšani Tab model nudi nevjerojatnu lakoću držanja za lakše rukovanje u pokretu. Usto je i lakši, iako to ne umanjuje njegove performance. Zapravo, Tab posjeduje moćni dvojezgreni procesor i dvije kamere. Također ćete uživati u više aplikacija tvrtki Samsung i Google te u besplatnoj Dropbox pohrani veličine 50 GB. Jednostavno ne može biti bolje od toga!',
  image_url:   'samsung_galaxy_tab.jpg',
  categorie_id_id: 2,    
  price: 330.00)
# . . .
Product.create!(title: 'Apple iPad Mini 16GB',
  description:
   'Ne dopustite da vas veličina zavara. iPad mini pokreće novi A7 čip s 64-bitnom arhitekturom. A7 donosi izvedbu ubojica - i do četiri puta brže CPU i do osam puta brže grafičke performanse u odnosu na prethodnu generaciju - bez žrtvovanja vijek trajanja baterije. Tako ćete dobiti nevjerojatnu moć u uređaju možete ponijeti sa sobom gdje god idete.',
  image_url: 'apple_ipad_mini.jpg',
    categorie_id_id: 2,    

  price: 475.00)
# . . .

Product.create!(title: 'Apple iPad Air 32GB 4G',
  description: 'Novi A7 čip u iPad Air je dizajniran s 64-bitnom arhitekturom. Ona pruža performanse ubojica - i do dva puta brže CPU-a i grafičke performanse od svog prethodnika - bez žrtvovanja vijek trajanja baterije. Tako ćete dobiti nevjerojatnu moć u uređaju možete ponijeti sa sobom gdje god idete.',
  image_url: 'sony.jpg',
    categorie_id_id: 1000.00,    

  price: 34.95)
Product.create!(title: 'LG G2',
  description: 
    'G2 je lijep način da se dokaže da je sazrelo vrijeme za smartphone koji je usredotočen na bitno. To impresionira na prvi pogled s instinktivnom dizajna, sa svojim vrhunskim hardverom i jednostavno oduševljena s praktičnim značajkama kao i intuitivno korisničko vodstvom fasciniran iznova svaki dan.Došlo je vrijeme za pametni telefon koji čini mobilni život lakšim i savršeno se uklapa u život.',
  image_url:   'lg_g21.jpg',  
    categorie_id_id: 2,    
  
  price: 565.00)
# . . .
Product.create!(title: 'Nokia Lumia 830',
  description:
    'Procesor Quad Core 1.2GHz, 1GB RAM memorije, 16GB interne memorije proširivo do 128GB microSD karticama, primarna kamera 10Mp, FullHD video, operativni sistem Microsoft Windows Phone 8.1.',
  image_url: 'nokia_lumia_8301.jpg',
    categorie_id_id: 2,    

  price: 690.00)
# . . .

Product.create!(title: 'Apple iPhone 6 128GB',
  description: 
    'Apple iPhone 6, 4G, Dual Core procesor, 8Mp kamera, IOS 8',
  image_url: 'iphone.jpg',
    categorie_id_id: 2,    

  price: 1770.00)

Product.create!(title: 'Samsung 55H7000',
  description: 
    'UE55H7000, FHD 3D SLIM LED SMART TV,Black Front, Super Narrow Bezel, FHD 1080p, 800 Hz CMR, Ultra Clear Panel, Micro Dimming Pro, Wide Color Enhancer (Plus), Quad Core processor, Dual Multi Screen, Dual tuner (2xDVB-T2/C/S2 and Analogue),3D',
  image_url: 'samsung_smart.jpg',
  categorie_id_id: 1,    
  price: 3399.00)
Product.create!(title: 'Sony 46W905',
  description: 
    'UE55H7000, FHD 3D SLIM LED SMART TV,Black Front, Super Narrow Bezel, FHD 1080p, 800 Hz CMR, Ultra Clear Panel, Micro Dimming Pro, Wide Color Enhancer (Plus), Quad Core processor, Dual Multi Screen, Dual tuner (2xDVB-T2/C/S2 and Analogue),3D',
  image_url: 'sony.jpg',
  categorie_id_id: 1,    
  price: 2842.00)