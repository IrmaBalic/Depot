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
User.delete_all
Category.delete_all
CategoryTranslation.delete_all
LineItem.delete_all
OrderedLineItem.delete_all
OrderedProductTranslation.delete_all
OrderedProduct.delete_all
Product.delete_all
ProductTranslation.delete_all
Address.delete_all
Cart.delete_all
City.delete_all
Country.delete_all
Order.delete_all



role_user = Role.create!(name: 'User')
role_admin = Role.create!(name: 'Admin')

category_1 = Category.create_item('TV i monitori', 'TV and desktop monitors')
category_2 = Category.create_item('Mobiteli i tableti', 'Smartphones and tablets')
category_3 = Category.create_item('Laptopi', 'Laptops')

User.create!(name:'admin', surname:'admin',email: 'admin', password_digest:'admin', role: role_admin)

product = Product.create!(title: 'Samsung Galaxy Tab 3',
  category: category_2, 
  price: 330, 
  image_url:'samsung_galaxy_tab.jpg')
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs", description: 'Uz GALAXY Tab 3 cijeli vam je jedan novi svijet nadohvat ruke. Tanji, uzi i s tanjim okvirom, ovaj novi i poboljsani 
    Tab model nudi nevjerojatnu lakocu drzanja za lakse rukovanje u pokretu. Usto je i laksi, iako to ne umanjuje njegove 
    performance. Zapravo, Tab posjeduje mocni dvojezgreni procesor i dvije kamere.')

product = Product.create!(title:'LG G2',
  image_url:   'lg_g21.jpg',  
  category: category_2,     
  price: 565)
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs",   description: 
    'G2 je lijep nacin da se dokaze da je sazrelo vrijeme za smartphone koji je usredotocen na bitno. To impresionira na prvi pogled s 
    instinktivnom dizajna, sa svojim vrhunskim hardverom i jednostavno odusevljena s prakticnim znacajkama kao i intuitivno korisnicko 
    vodstvom fasciniran iznova svaki dan.')

product = Product.create!(title: 'Nokia Lumia 830',
  category: category_2,     
  price: 690,
  image_url: 'nokia_lumia_8301.jpg')
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs", description:
    'Procesor Quad Core 1.2GHz, 1GB RAM memorije, 16GB interne memorije prosirivo do 128GB microSD karticama, primarna kamera 10Mp, 
    FullHD video, operativni sistem Microsoft Windows Phone 8.1.')

product = Product.create!(title: 'Apple iPhone 6 128GB',
  image_url: 'iphone6.jpg',
  category: category_2,    
  price: 1770)
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs",  description: 
  'Apple iPhone 6, 4G, Dual Core procesor, 8Mp kamera, IOS 8')

product = Product.create!(title: 'Samsung 55H7000',
  image_url: 'samsung_smart.jpg',
  category: category_1,   
  price: 3399)
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs",   description: 
   'UE55H7000, FHD 3D SLIM LED SMART TV,Black Front, Super Narrow Bezel, FHD 1080p, 800 Hz CMR, Ultra Clear Panel, Micro Dimming Pro,
     Wide Color Enhancer (Plus), Quad Core processor, Dual Multi Screen, Dual tuner (2xDVB-T2/C/S2 and Analogue),3D')

product = Product.create!(title: 'Sony 46W905',
  image_url: 'sony.jpg',
  category: category_1,  
  price: 2842)
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs",   description: 
    'UE55H7000, FHD 3D SLIM LED SMART TV,Black Front, Super Narrow Bezel, FHD 1080p, 800 Hz CMR, Ultra Clear Panel, Micro Dimming Pro,
     Wide Color Enhancer (Plus), Quad Core processor, Dual Multi Screen, Dual tuner (2xDVB-T2/C/S2 and Analogue),3D')

product = Product.create!(title: 'Apple iPad Air 32GB 4G',
  image_url: 'apple_ipad_air.jpg',
  category: category_2,    
  price: 1000)
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs",   description: 
  'Novi A7 cip u iPad Air je dizajniran s 64-bitnom arhitekturom. Ona pruza performanse ubojica - i do dva puta brze 
  CPU-a i graficke performanse od svog prethodnika - bez zrtvovanja vijek trajanja baterije. Tako cete dobiti nevjerojatnu moc u 
  uredjaju mozete ponijeti sa sobom gdje god idete.')

product = Product.create!(title: 'Apple MacBook Air 11',
  image_url: 'apple_mac.jpg',
  category: category_3,    
  price: 1950)
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs",   description: 
    '- 1.3GHz dual-core Intel Core i5 processor - Turbo Boost up to 2.6GHz - Intel HD Graphics 5000 - 4GB memory - 256GB flash storage')

product = Product.create!(title: 'Sony VAIO DUO',
  image_url: 'sony_laptop.jpg',
  category: category_3,    
  price: 3062)
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs",   description: 
    'CPU:Intel Core i5-4200U Processor CPU: 1.60 Ghz with Turbo Boost up to 2.60 Ghz DISPLAY:TRILUMINOS DISPLAY 
  for mobile 13,3" DISPLAY: Full HD,1920 x 1080 VGA:Intel HD Graphics 4400 RAM: 4 GB DDR3 max 4 GB HDD: 128 GB SSD 6GB/s ODD: 
    n/a WLAN: 802.11b/g/n, Bluetooth 4.0 OSTALO: Card Reader, 8MP Exmorekamera,HDMI, USB3.0 BOJA: bijela Baterija: do 5 h ')

product = Product.create!(title: 'Lenovo ThinkPad T440',
  image_url: 'lenovo.jpg',
  category: category_3,    
  price: 1799)
ProductTranslation.create!(product: product, locale: "en", description: 'description_en')
ProductTranslation.create!(product: product, locale: "bs",   description: 
    'Model: ThinkPad T440 20B6-099LMD, Intel i5-4210U procesor - 1,7GHz (Turbo 2,7GHz), Intel HD 4400 grafika, 4GB DDR3L 
  RAM memorije, Disk SSD 128GB, 14" LCD Display, Windows 8.1 licenca...')
# . . .
