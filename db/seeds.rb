#THIS SEED FILE CREATES THE FOLLOWING CONDITIONS
#30 users, with the first user being Tom
#Tom (user1) plays all activities, and has swiped yes on all users.
#Mark (user2) plays Racquetball, and has liked Tom, so they are a match.

User.delete_all
Activity.delete_all
ActivityBlurb.delete_all
Swipe.delete_all
Match.delete_all
Message.delete_all



# Create activities
activity_names = [
"billiards","darts","bocce ball","bowling","cycling","diving","frisbee golf","golf","handball","hiking","ping pong","racquetball","rock-climbing","running","sailing","skiing"," snowboarding","squash","surfing","tennis","wrestling","yoga"]
activities = []
activity_names.each do |activity|
  activities << Activity.create(name: activity)
end

#Create Tom
# tom = User.create!({
#                     first_name: "Tom",
#                     last_name: "Likes Everyone",
#                     email: 'tom@myspace.com',
#                     gender: 'male',
#                     age: 40,
#                     bio: 'Welcome to EverythingButSex. I will be your friend for everything but sex.',
#                     location: "San Francisco",
#                     latitude: 37.7576792,
#                     longitude: -122.5078123,
#                     profile_picture_url: "http://www.eonline.com/eol_images/Entire_Site/2015518/rs_600x600-150618104510-600.tom-myspace.jw.61815_2.jpg",
#                     password: 'password'
#                       })
#
# activities.each_with_index do |activity, index|
#   ActivityBlurb.create!({
#       text: "I've been playing #{activity} since 1999.",
#       activity_id: index,
#       user_id: 1
#       })
# end

# Create other users

pool_peter = User.create!({
    first_name: "Peter",
    last_name: "Poolshark",
    email: "pool_peter@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://img.khelnama.com/sites/default/files/styles/content_full_width/public/previewimage/news/2012/Oct/Pankaj%20Advani1.jpg",
    password: 'password'
  })

bocce_britney = User.create!({
    first_name: "Britney",
    last_name: "Boccelli",
    email: "bocce_britney@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.outmotoring.com/images/D/MIN_bocce_detail_1.jpg",
    password: 'password'
  })

bowling_bernie = User.create!({
    first_name: "Bernie",
    last_name: "Bowler",
    email: "bowling_bernie@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.ew.com/sites/default/files/i/imgs/060126//145251__kingpin_l.jpg",
    password: 'password'
  })

cycling_cat = User.create!({
    first_name: "Cat",
    last_name: "Cycletonr",
    email: "cycling_cat@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://prexamples.com/wp-content/uploads/2012/12/foxy-bingo-hair-dye-peter-wright.jpg",
    password: 'password'
  })

darts_dan = User.create!({
    first_name: "Dan",
    last_name: "Dartsmouth",
    email: "darts_dan@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://prexamples.com/wp-content/uploads/2012/12/foxy-bingo-hair-dye-peter-wright.jpg",
    password: 'password'
  })

scubasteve = User.create!({
    first_name: "Steve",
    last_name: "Scuber",
    email: "scubasteve@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://manchebo-674702.c.cdn77.org/photos/Aruba-Scuba-Diver-Turtle.jpg",
    password: 'password'
  })

frisbee_golfer = User.create!({
    first_name: "Fris",
    last_name: "Begolfer",
    email: "frisbee_golfer@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://www.threeriversparks.org/~/media/Parks%20and%20Trails/Hyland/Hyland%20Disc%20Golf%20Course/08022005_disc1.ashx",
    password: 'password'
  })

golf_girl = User.create!({
    first_name: "Felicia",
    last_name: "Fairway",
    email: "golf_girl@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://www.threeriversparks.org/~/media/Parks%20and%20Trails/Hyland/Hyland%20Disc%20Golf%20Course/08022005_disc1.ashx",
    password: 'password'


golf_girl = User.create!({
    first_name: "Francis",
    last_name: "Fairway",
    email: "golf_girl@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://golfgurls.com/wp-content/uploads/2010/02/young_golfer_visor-e1266850768252.jpg",
    password: 'password'
  })

handball_hannah = User.create!({
    first_name: "Hannah",
    last_name: "Handball",
    email: "handball_hannah@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.olympic.org/Assets/MediaPlayer/Videos/2008/08/23/lot1-2008%20handball%20w%20final/Handball_Video_BIG_630.jpg",
    password: 'password'
  })

hiking_harry = User.create!({
    first_name: "Harry",
    last_name: "Hikerberry",
    email: "hiking_harry@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://farm4.static.flickr.com/3508/3871896186_ede8169835.jpg",
    password: 'password'
  })

ping = User.create!({
    first_name: "Ping",
    last_name: "Pong",
    email: "ping@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://cdn.evbuc.com/eventlogos/28972529/pingpong.jpg",
    password: 'password'
  })

racquet_roger = User.create!({
    first_name: "Rocket",
    last_name: "Roger",
    email: "racquet_roger@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.rowan.edu/studentaffairs/rec/intramurals/images/racquetball-01.jpg",
    password: 'password'
  })

rock_climing_rachel = User.create!({
    first_name: "Rachel",
    last_name: "Roche",
    email: "rock_climing_rachel@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://s-media-cache-ak0.pinimg.com/236x/e0/7a/ca/e07aca14f0c77283688666ed5858f0e3.jpg",
    password: 'password'
  })

running_rena = User.create!({
    first_name: "Rena",
    last_name: "Runner",
    email: "running_rena@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.runningshoesguru.com/wp-content/uploads/2014/10/runningmag1.jpg",
    password: 'password'
  })

sailing_sam = User.create!({
    first_name: "Sam",
    last_name: "Sailor",
    email: "sailing_sam@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.freedomsailingadventures.com/wp-content/uploads/2012/01/the_captain_7_300w.jpg",
    password: 'password'
  })

skiergal = User.create!({
    first_name: "Lindsey",
    last_name: "VonnSkier",
    email: "skiergal@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://img2-1.timeinc.net/people/i/2010/news/100301/lindsey-vonn-240.jpg",
    password: 'password'
  })

snowboard_gal = User.create!({
    first_name: "Snow",
    last_name: "Bunny",
    email: "snowboard_gal@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://d1vh373dea9f1i.cloudfront.net/blog/wp-content/uploads/Torah-Bright.jpg",
    password: 'password'
  })

squash_snap = User.create!({
    first_name: "SnapThat",
    last_name: "squash",
    email: "squash_snap@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.squashnz.co.nz/content/images/players/evanwilliams/Evan%20Williams%20photoshoot%202011%202.jpg",
    password: 'password'
  })

surfer_sam = User.create!({
    first_name: "Sam",
    last_name: "Mavericks",
    email: "surfer_sam@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.vivaboo.com/wp-content/uploads/2010/10/surfer-surfing.jpg",
    password: 'password'
  })

tennis_gal = User.create!({
    first_name: "Tanya",
    last_name: "Tenis",
    email: "tennis_gal@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://lh5.googleusercontent.com/7dAaPmzgkuRkaZjLZHOaAS8iXx3in-ku3P9oPB55b2ZJznZldIhQ64jjgJUSg-REbPSJrNmx-j2aV8rSdO6UD4gbiu2rIbHzlvULreJq0mngTqiroDJEHi7jbrmD5sTi58hBIek",
    password: 'password'
  })

wrestling_will = User.create!({
    first_name: "Will",
    last_name: "Wrestler",
    email: "wrestling_will@example.com",
    gender: "male",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://unitedworldwrestling.org/sites/default/files/media/image/article/img_0017.jpg",
    password: 'password'
  })

yogie = User.create!({
    first_name: "Yasmine",
    last_name: "Yogie",
    email: "yogie@example.com",
    gender: "female",
    age: rand(18..40),
    bio: Faker::Hipster.sentences(4).join(' '),
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://hotlantayoga.com/wp-content/uploads/2014/01/yoga-mp-balatsinos.png",
    password: 'password'
  })

(1..22).to_a.each do |activity_id|
  activity_name = Activity.find(activity_id).name
  ActivityBlurb.create!({
    text: "I've been playing#{activity_name} since I was a kid, and love to play on weekends.",
    activity_id: activity_id,
    user_id: activity_id
    })
  other_activities = (1..22).to_a - activity_id
  ActivityBlurb.create!({
    text: "I'm just a beginner looking to learn more.",
    activity_id: (1..22).to_a.sample,
    user_id: user.id
    })
end

#everyone swipes on you (run for each seeded team member)
def everyone_swipes_you
  seed_users = User.where("id <= 30")
  you = User.last
  seed_users.each do |user|
      Swipe.create!({
        swiped_yes: [true,false].sample,
        swiper_id: user.id,
        swipee_id: you.id
        })
  end
end

#create Brian
brian = User.create!({
                  first_name: "Brian",
                  last_name: "Bensch",
                  email: "bbensch@gmail.com",
                  gender: "male",
                  age: rand(25..35),
                  bio: "I grew up in Santa Clara and have now lived in San Francisco for the last 7 years.",
                  location: "San Francisco",
                  latitude: 37.7576792,
                  longitude: -122.5078123,
                  profile_picture_url: "https://scontent-sea1-1.xx.fbcdn.net/hphotos-xpa1/t31.0-8/883728_944546868346_1007231685_o.jpg",
                  password: 'password'
                    })

ActivityBlurb.create!({
    text: "I've been skiing since I was 5 and rent a Tahoe house near Squaw every winter.",
    activity_id: 15,
    user_id: brian.id
    })

ActivityBlurb.create!({
    text: "I'm really good at bar games, at least the drinking part.",
    activity_id: 1,
    user_id: brian.id
    })

#everyone swipes Brian
everyone_swipes_you

#create Nil
nil_thacker = User.create!({
                  first_name: "Nil",
                  last_name: "Thacker",
                  email: "nil@nil.gs",
                  gender: "male",
                  age: rand(25..35),
                  bio: "I'm from LA. I like to code",
                  location: "San Francisco",
                  latitude: 37.7576792,
                  longitude: -122.5078123,
                  profile_picture_url: "https://scontent-lga3-1.xx.fbcdn.net/hprofile-xpa1/v/t1.0-1/c22.1.185.185/250208_10150270016197149_6234017_n.jpg?oh=470ad2ef3ab3388683e2648e98f0f23f&oe=57432F14",
                  password: 'password'
                    })

ActivityBlurb.create!({
    text: "I will crush you at foosball.",
    activity_id: 1,
    user_id: nil_thacker.id
    })

#everyone swipes Nil
everyone_swipes_you

#create Trevor
trevor = User.create!({
                  first_name: "Trevor",
                  last_name: "Newcomb",
                  email: "Tnewcomb0@gmail.com",
                  gender: "male",
                  age: rand(25..35),
                  bio: "TBD",
                  location: "Mountain View",
                  latitude: 37.7576792,
                  longitude: -122.5078123,
                  profile_picture_url: "https://scontent-lga3-1.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/11429970_10152944610704562_3007318549682082835_n.jpg?oh=deccbf78e11984599490132a727d8ced&oe=576F4914",
                  password: 'password'
                    })

ActivityBlurb.create!({
    text: "Let's play some darts!",
    activity_id: 1,
    user_id: trevor.id
    })

#everyone swipes Trevor
everyone_swipes_you

#create Abe
abe = User.create!({
                  first_name: "Abe",
                  last_name: "Clark",
                  email: "abeaclark@gmail.com",
                  gender: "male",
                  age: rand(25..35),
                  bio: "TBD",
                  location: "Diamond Heights",
                  latitude: 37.7576792,
                  longitude: -122.5078123,
                  profile_picture_url: "https://scontent-lga3-1.xx.fbcdn.net/hphotos-xlf1/v/t1.0-9/12509300_10156395860765273_5982743154224695433_n.jpg?oh=09f8888d193e1b85c332ff163aee8694&oe=572462F7",
                  password: 'password'
                    })

ActivityBlurb.create!({
    text: "I may not drink much, but when I play bar games, I crush.",
    activity_id: 1,
    user_id: abe.id
    })

#everyone swipes Greg
everyone_swipes_you

#create Greg
greg = User.create!({
                  first_name: "Greg",
                  last_name: "Wehmeier",
                  email: "wehmenstein@gmail.com",
                  gender: "male",
                  age: rand(25..35),
                  bio: "TBD",
                  location: "San Francisco",
                  latitude: 37.7576792,
                  longitude: -122.5078123,
                  profile_picture_url: "https://scontent-lga3-1.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/12063360_10106705349412900_4054142801918383241_n.jpg?oh=624af745e985d10e7eba82a14ce7c050&oe=574413B1",
                  password: 'password'
                    })

ActivityBlurb.create!({
    text: "Professional billiards champion.",
    activity_id: 1,
    user_id: greg.id
    })

#everyone swipes Greg
everyone_swipes_you

# #AUTOGENERATE MESSAGE WITH EACH MATCH from the original user
# Match.all.each do |match|
#   Message.create!({
#   match_id: match.id,
#   user_id: match.first_user_id,
#   message_text: "(This message is auto generated): It's cool to see we have something in common. Want to meet up?"
#   })
# end
