namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
      50.times do
        content = Faker::Lorem.sentence(5)
        users.each { |user| user.microposts.create!(content: content) }
    end
  end
  task fill: :environment do
    Lot.create!(name: "Admissions",
                lotid: "105",
                permit: "green")
    Lot.create!(name: "Tower Garage",
                lotid: "106",
                permit: "green")
    Lot.create!(name: "Woods St. Garage",
                lotid: "108",
                permit: "green")
    Lot.create!(name: "Science",
                lotid: "110",
                permit: "green")
    Lot.create!(name: "San Jacinto Hall",
                lotid: "112",
                permit: "green")
    Lot.create!(name: "Matthews Street Garage",
                lotid: "113",
                permit: "green")
    Lot.create!(name: "College Inn",
                lotid: "202",
                permit: "green")                                                    
    Lot.create!(name: "Hornsby",
                lotid: "203",
                permit: "green")  
    Lot.create!(name: "Jackson-Rear",
                lotid: "204",
                permit: "green")  
    Lot.create!(name: "Elm Lot",
                lotid: "207",
                permit: "green")  
    Lot.create!(name: "Llano Drive",
                lotid: "301",
                permit: "green")  
    Lot.create!(name: "Blanco Garage",
                lotid: "303",
                permit: "green")  
    Lot.create!(name: "Academy Street Garage",
                lotid: "304",
                permit: "green")

    Lot.create!(name: "President's Lot",
                lotid: "C-12",
                permit: "purple")  
    Lot.create!(name: "Sessom Lot",
                lotid: "P/AZ-5",
                permit: "purple")  
    Lot.create!(name: "Speck Lot",
                lotid: "P/AZ-6",
                permit: "purple")  
    Lot.create!(name: "Strahan Lot",
                lotid: "P/AZ-8",
                permit: "purple")  
    Lot.create!(name: "Coliseum Lot",
                lotid: "P/AZ-9",
                permit: "purple")  
    Lot.create!(name: "Bobcat Stadium Lots",
                lotid: "P/AZ-10",
                permit: "purple")  
     Lot.create!(name: "Mill Street",
                lotid: "P/AZ-12",
                permit: "purple")  
    Lot.create!(name: "Speck Street Garage",
                lotid: "P/AZ-13",
                permit: "purple")  

    Lot.create!(name: "Sessom Lot",
                lotid: "R-2",
                permit: "red")  
    Lot.create!(name: "Alkek Garage",
                lotid: "R-4",
                permit: "red")  
    Lot.create!(name: "Pleasant Street Garage",
                lotid: "R-5",
                permit: "red")  
    Lot.create!(name: "Physical Plant",
                lotid: "R-6",
                permit: "red") 
    Lot.create!(name: "Ag. / Sessom",
                lotid: "R-7",
                permit: "red")  
    Lot.create!(name: "JCK / Moon",
                lotid: "R-9",
                permit: "red")  
    Lot.create!(name: "JCK / Sessom",
                lotid: "R-10",
                permit: "red")  
    Lot.create!(name: "Freeman",
                lotid: "R-11",
                permit: "red") 
    Lot.create!(name: "Music",
                lotid: "R-12",
                permit: "red")  
    Lot.create!(name: "Strahan Reserve",
                lotid: "R-13",
                permit: "red")  
    Lot.create!(name: "Jowers",
                lotid: "R-14",
                permit: "red")  
    Lot.create!(name: "State Street",
                lotid: "R-15",
                permit: "red") 
    Lot.create!(name: "Aqua Sports",
                lotid: "R-16",
                permit: "red")  
    Lot.create!(name: "CDC",
                lotid: "R-17",
                permit: "red")  
    Lot.create!(name: "FCS",
                lotid: "R-18",
                permit: "red")  
    Lot.create!(name: "River House",
                lotid: "R-19",
                permit: "red")  
    Lot.create!(name: "Science",
                lotid: "R-20",
                permit: "red")  
    Lot.create!(name: "ROTC",
                lotid: "R-21",
                permit: "red")  
    Lot.create!(name: "Admissions",
                lotid: "R-22",
                permit: "red")  
    Lot.create!(name: "Brazos",
                lotid: "R-23",
                permit: "red") 
    Lot.create!(name: "Maint. West",
                lotid: "R-24",
                permit: "red")  
    Lot.create!(name: "Canyon Hall",
                lotid: "R-26",
                permit: "red")  
    Lot.create!(name: "SHC / Cogen Plant",
                lotid: "R-31",
                permit: "red")  
    Lot.create!(name: "Boiler Plant",
                lotid: "R-32",
                permit: "red") 
    Lot.create!(name: "Swinney House",
                lotid: "R-36",
                permit: "red")  
    Lot.create!(name: "Hillburn House",
                lotid: "R-37",
                permit: "red")  
    Lot.create!(name: "Tennis Center",
                lotid: "R-38",
                permit: "red")  
    Lot.create!(name: "Endzone Complex",
                lotid: "R-39",
                permit: "red")
    Lot.create!(name: "Mitte",
                lotid: "R-40",
                permit: "red")  
    Lot.create!(name: "Strahan Expansion",
                lotid: "R-41",
                permit: "red")  
    Lot.create!(name: "Woods Street Garage",
                lotid: "R-42",
                permit: "red")  
    Lot.create!(name: "Mitte Service Drive",
                lotid: "R-43",
                permit: "red")  
    Lot.create!(name: "McCoy",
                lotid: "R-44",
                permit: "red")  
    Lot.create!(name: "Holland Street",
                lotid: "R-45",
                permit: "red")  
    Lot.create!(name: "Matthews Street Garage",
                lotid: "R-46",
                permit: "red")  
    Lot.create!(name: "Commons",
                lotid: "R-48",
                permit: "red") 
    Lot.create!(name: "Education",
                lotid: "R-49",
                permit: "red")

    Lot.create!(name: "Bobcat Village",
                lotid: "BV",
                permit: "silver")  
    Lot.create!(name: "Comanche Hill",
                lotid: "CMH",
                permit: "silver")  
    Lot.create!(name: "Campus Colony",
                lotid: "CCA",
                permit: "silver") 
    Lot.create!(name: "Riverside",
                lotid: "RSA",
                permit: "silver")  

    Lot.create!(name: "Sessom",
                lotid: "CP-5",
                permit: "pool")  
    Lot.create!(name: "President's",
                lotid: "CP-12",
                permit: "pool")  
    Lot.create!(name: "Elm Street",
                lotid: "CP-207",
                permit: "pool")    

    Lot.create!(name: "LBJ Parking Garage",
                lotid: "LPG",
                permit: "pay")  
    Lot.create!(name: "Edward Gary Street Garage",
                lotid: "EGSG",
                permit: "pay")                                    
  end
end