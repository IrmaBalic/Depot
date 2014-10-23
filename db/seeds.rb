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
role_1 = Role.find_by(name: 'User')
role_2 = Role.find_by(name: 'Admin')

Categorie.delete_all
Categorie.create!(name: 'TV i monitori')
Categorie.create!(name: 'Mobiteli i tableti')
Categorie.create!(name: 'Laptopi')
category_1 = Categorie.find_by(name: 'TV i monitori')
category_2 = Categorie.find_by(name: 'Mobiteli i tableti')
category_3 = Categorie.find_by(name: 'Laptopi')

User.delete_all
User.create!(email: 'admin', password_digest:'admin', role_id: role_2.id)

LineItem.delete_all
Product.delete_all
Product.create!(title: 'Samsung Galaxy Tab 3 7.0',
  description: 
    'Uz GALAXY Tab 3 cijeli vam je jedan novi svijet nadohvat ruke. Tanji, uzi i s tanjim okvirom, ovaj novi i poboljsani 
    Tab model nudi nevjerojatnu lakocu drzanja za lakse rukovanje u pokretu. Usto je i laksi, iako to ne umanjuje njegove 
    performance. Zapravo, Tab posjeduje mocni dvojezgreni procesor i dvije kamere.',
  image_url:   'samsung_galaxy_tab.jpg',
  categorie_id: category_2.id,    
  price: 330)
# . . .
Product.create!(title:'LG G2',
  description: 
    'G2 je lijep nacin da se dokaze da je sazrelo vrijeme za smartphone koji je usredotocen na bitno. To impresionira na prvi pogled s 
    instinktivnom dizajna, sa svojim vrhunskim hardverom i jednostavno odusevljena s prakticnim znacajkama kao i intuitivno korisnicko 
    vodstvom fasciniran iznova svaki dan.',
  image_url:   'lg_g21.jpg',  
  categorie_id: category_2.id,     
  price: 565)
Product.create!(title: 'Nokia Lumia 830',
  description:
    'Procesor Quad Core 1.2GHz, 1GB RAM memorije, 16GB interne memorije prosirivo do 128GB microSD karticama, primarna kamera 10Mp, 
    FullHD video, operativni sistem Microsoft Windows Phone 8.1.',
  image_url: 'nokia_lumia_8301.jpg',
  categorie_id: category_2.id,     
  price: 690)
Product.create!(title: 'Apple iPhone 6 128GB',
  description: 
    'Apple iPhone 6, 4G, Dual Core procesor, 8Mp kamera, IOS 8',
  image_url: 'iphone6.jpg',
  categorie_id: category_2.id,    
  price: 1770)
Product.create!(title: 'Samsung 55H7000',
  description: 
    'UE55H7000, FHD 3D SLIM LED SMART TV,Black Front, Super Narrow Bezel, FHD 1080p, 800 Hz CMR, Ultra Clear Panel, Micro Dimming Pro,
     Wide Color Enhancer (Plus), Quad Core processor, Dual Multi Screen, Dual tuner (2xDVB-T2/C/S2 and Analogue),3D',
  image_url: 'samsung_smart.jpg',
  categorie_id: category_1.id,   
  price: 3399)
Product.create!(title: 'Sony 46W905',
  description: 
    'UE55H7000, FHD 3D SLIM LED SMART TV,Black Front, Super Narrow Bezel, FHD 1080p, 800 Hz CMR, Ultra Clear Panel, Micro Dimming Pro,
     Wide Color Enhancer (Plus), Quad Core processor, Dual Multi Screen, Dual tuner (2xDVB-T2/C/S2 and Analogue),3D',
  image_url: 'sony.jpg',
  categorie_id: category_1.id,  
  price: 2842)
Product.create!(title: 'Apple iPad Air 32GB 4G',
  description: 'Novi A7 cip u iPad Air je dizajniran s 64-bitnom arhitekturom. Ona pruza performanse ubojica - i do dva puta brze 
  CPU-a i graficke performanse od svog prethodnika - bez zrtvovanja vijek trajanja baterije. Tako cete dobiti nevjerojatnu moc u 
  uredjaju mozete ponijeti sa sobom gdje god idete.',
  image_url: 'apple_ipad_air.jpg',
  categorie_id: category_2.id,    
  price: 1000)
Product.create!(title: 'Apple MacBook Air 11',
  description: '- 1.3GHz dual-core Intel Core i5 processor - Turbo Boost up to 2.6GHz - Intel HD Graphics 5000 - 4GB memory - 256GB flash storage',
  image_url: 'apple_mac.jpg',
  categorie_id: category_3.id,    
  price: 1950)
Product.create!(title: 'Sony VAIO DUO',
  description: 'CPU:Intel Core i5-4200U Processor CPU: 1.60 Ghz with Turbo Boost up to 2.60 Ghz DISPLAY:TRILUMINOS DISPLAY 
  for mobile 13,3" DISPLAY: Full HD,1920 x 1080 VGA:Intel HD Graphics 4400 RAM: 4 GB DDR3 max 4 GB HDD: 128 GB SSD 6GB/s ODD: 
    n/a WLAN: 802.11b/g/n, Bluetooth 4.0 OSTALO: Card Reader, 8MP Exmorekamera,HDMI, USB3.0 BOJA: bijela Baterija: do 5 h ',  
  image_url: 'sony_laptop.jpg',
  categorie_id: category_3.id,    
  price: 3062)
Product.create!(title: 'Lenovo ThinkPad T440',
  description: 'Model: ThinkPad T440 20B6-099LMD, Intel i5-4210U procesor - 1,7GHz (Turbo 2,7GHz), Intel HD 4400 grafika, 4GB DDR3L 
  RAM memorije, Disk SSD 128GB, 14" LCD Display, Windows 8.1 licenca...',  
  image_url: 'lenovo.jpg',
  categorie_id: category_3.id,    
  price: 1799)
# . . .
