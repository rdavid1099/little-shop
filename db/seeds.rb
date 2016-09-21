# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
trips = Trip.create([
  {title: "Kenny's Parents' Basement", description: "Enjoy a luxurious weekend at Kenny's Parents' basement.", price: 199.99, trip_image: File.new("./public/images/medium/Basement.jpg")},
  {title: 'Tea Ski', description: "Sit in the lap of luxury.  Enjoy a relaxing weekend water skiing in a freshly steeped pond.", price: 599.99, trip_image: File.new("./public/images/medium/shoeski_fail.jpg")},
  {title: 'Treehouse Getaway', description: "Who said treehouses are only for kids.  You and your significant other can relive the days of old climbing up and down this luxurious bungalow.", price: 299.99, trip_image: File.new("./public/images/medium/treehouse.jpg")},
  {title: 'Spooky Forest', description: "It doesn't have to be Halloween to have a spooky getaway.  Be one with the wilderness at this creepy destination, if you dare.", price: 666.00, trip_image: File.new("./public/images/medium/Sunny_Lenga_Forest.jpg")},
  {title: 'Slippery Slope', description: "If you take this vacation, you'll buy everything else we have to offer.  See why everyone says there's no coming back from this luxurious destination.", price: 111.11, trip_image: File.new("./public/images/medium/slippery-slope.jpg")},
  {title: 'New Snork City', description: "Come along with Snorks.  Swim along with Snorks.  So much to see waiting for you and me.  Have some fun with the Snorks", price: 800.88, trip_image: File.new("./public/images/medium/Snorks_119_1.jpg")},
  {title: 'Island Adventure Park', description: "Be one of the first to see this state of the art adventure park.  What could possibli go wrong?", price: 1999.95, trip_image: File.new("./public/images/medium/jurassic.jpg")},
  {title: 'Space Travel Experience', description: "Join legendary captain Mark Watney on this once in a lifetime opportunity to be one of the first civilians to colonize Mars.", price: 99999.95, trip_image: File.new("./public/images/medium/mars.jpg")},
  {title: 'Hotel Winter Housekeeper', description: "FREE! Come stay the winter at the beautiful Stanley hotel in room 237. Just keep the place in one piece and make sure you play; don't do all work.", price: 1.99, trip_image: File.new("./public/images/medium/OverlookHotelShining.fw.png")},
  {title: 'Crazy Crowded Beach', description: "Everyone is there but YOU! Experience the true peak season from June to August at Crazy Crowded Beach, which is bustling with activity.  This beach will not bore!", price: 1599.99, trip_image: File.new("./public/images/medium/Crazy-Crowded-Beach-in-Rio-De-Janeiro-that-is-Insane.jpg")},
  {title: 'Scenic Helicopter Ride - Nebraska', description: "Circles and squares as far as the eye can see!  Experience Nebraska's great plains like never before! View many historic trails explored by the Lewis and Clark Expedition. Where the West Begins!", price: 9.99, trip_image: File.new("./public/images/medium/field.jpg")}
])

CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Family Fun'), trip: trips[0]},
  {category: Category.find_or_create_by(title: 'Chilly'), trip: trips[0]},
  {category: Category.find_or_create_by(title: 'Bang For Your Buck'), trip: trips[0]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Family Fun'), trip: trips[1]},
  {category: Category.find_or_create_by(title: 'Water Sports'), trip: trips[1]},
  {category: Category.find_or_create_by(title: 'Athletic'), trip: trips[1]},
  {category: Category.find_or_create_by(title: 'Beach'), trip: trips[1]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Family Fun'), trip: trips[2]},
  {category: Category.find_or_create_by(title: 'Lazy Days'), trip: trips[2]},
  {category: Category.find_or_create_by(title: 'Athletic'), trip: trips[2]},
  {category: Category.find_or_create_by(title: 'Desolate'), trip: trips[2]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Athletic'), trip: trips[3]},
  {category: Category.find_or_create_by(title: 'Chilly'), trip: trips[3]},
  {category: Category.find_or_create_by(title: 'Desolate'), trip: trips[3]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Mountains'), trip: trips[4]},
  {category: Category.find_or_create_by(title: 'Athletic'), trip: trips[4]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Family Fun'), trip: trips[5]},
  {category: Category.find_or_create_by(title: 'Water Sports'), trip: trips[5]},
  {category: Category.find_or_create_by(title: 'Bang For Your Buck'), trip: trips[5]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Family Fun'), trip: trips[6]},
  {category: Category.find_or_create_by(title: 'Island Getaway'), trip: trips[6]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Space Travel'), trip: trips[7]},
  {category: Category.find_or_create_by(title: 'One of a Kind'), trip: trips[7]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Family Fun'), trip: trips[8]},
  {category: Category.find_or_create_by(title: 'Mountains'), trip: trips[8]},
  {category: Category.find_or_create_by(title: 'Bang For Your Buck'), trip: trips[8]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Family Fun'), trip: trips[9]},
  {category: Category.find_or_create_by(title: 'Beach'), trip: trips[9]},
  {category: Category.find_or_create_by(title: 'Water Sports'), trip: trips[9]}
])
CategoriesTrip.create([
  {category: Category.find_or_create_by(title: 'Family Fun'), trip: trips[10]},
  {category: Category.find_or_create_by(title: 'Xtreme'), trip: trips[10]},
  {category: Category.find_or_create_by(title: 'Bang For Your Buck'), trip: trips[10]}
])

User.create(name: 'Admin Bob', username: 'admin', password: '@dminPa$$word', email: 'admin@email.com', role: 1)
