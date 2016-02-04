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
"pool / billiards","darts","bocce ball","bowling","cycling","diving","frisbee golf","golf","handball","hiking","ping pong","racquetball","rock-climbing","running","sailing","skiing"," snowboarding","squash","surfing","tennis","wrestling","yoga"]
activities = []
activity_names.each do |activity|
  activities << Activity.create!(name: activity)
end

# Create other users

billiards_bill = User.create!({
    first_name: "Billiards Bill",
    last_name: "Poolshark",
    email: "billiards_bill@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "My favorite pool bar is Jillians in downtown. I grew up in the East Bay and love swindling i-bankers out of their money.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://img.khelnama.com/sites/default/files/styles/content_full_width/public/previewimage/news/2012/Oct/Pankaj%20Advani1.jpg",
    password: 'password'
  })

bocce_britney = User.create!({
    first_name: "Britney Boccelli",
    last_name: "Smith",
    email: "bocce_britney@example.com",
    gender: "female",
    age: rand(18..40),
    bio: "After four years in Santa Barbara, I recently left the beach and moved to SF. IMO, Nothing beats a Sunday afternoon of bocce ball and Bacardi.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://media3.popsugar-assets.com/files/2012/08/32/3/301/3019466/4e7ed63c60510f0c_0b18b9d0d8ff11e1ba8122000a1e88a8_7.xxxlarge/i/Play-Bocce-Ball.jpg",
    password: 'password'
  })

bowling_bernie = User.create!({
    first_name: "Bernie Bowler",
    last_name: "Smith",
    email: "bowling_bernie@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I've lived in SF since 1970, back when bowling was cool. Looking for others who feel the bern to bowl.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.ew.com/sites/default/files/i/imgs/060126//145251__kingpin_l.jpg",
    password: 'password'
  })

cycling_cat = User.create!({
    first_name: "Catwheel Cycleton",
    last_name: "Smith",
    email: "cycling_cat@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I commute every day into the city from Marin on my carbon-frame Cannondale. Love long Saturday rides to Stinson beach.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://cdn.images.express.co.uk/img/dynamic/11/590x/Woman-cycling-550375.jpg",
    password: 'password'
  })

darts_dan = User.create!({
    first_name: "Dan Dartsmouth",
    last_name: "Smith",
    email: "darts_dan@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I'm a regular at the Albatross in Berkeley. I love darts and drinking, and am always up for creating new variations on the classic darts scoring.",
    location: "Berkeley, CA",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://prexamples.com/wp-content/uploads/2012/12/foxy-bingo-hair-dye-peter-wright.jpg",
    password: 'password'
  })

scubasteve = User.create!({
    first_name: "Scuba Stephanie",
    last_name: "Smith",
    email: "scubasteve@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I've gone scuba diving in 4 continents, but recently moved to SF, where the options are limited. Would love to find someone to plan a trip with.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.excursionphotos.com/wp-content/uploads/2014/12/scuba-diver-large.jpg",
    password: 'password'
  })

frisbee_golfer = User.create!({
    first_name: "Fris Begolfer",
    last_name: "Smith",
    email: "frisbee_golfer@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I was introduced to Frisbee golf while at Brown, and am looking to find folks to play in Golden Gate Park on weekends when its not foggy and 40 degrees.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://www.threeriversparks.org/~/media/Parks%20and%20Trails/Hyland/Hyland%20Disc%20Golf%20Course/08022005_disc1.ashx",
    password: 'password'
  })

golf_girl = User.create!({
    first_name: "Felicia Fairway",
    last_name: "Smith ",
    email: "golf_girl@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I played high school golf with Jordan Spieth, and just graduated from Stanford. Looking to play casual games with other avid golfers. Handicap: +2",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://golfgurls.com/wp-content/uploads/2010/02/young_golfer_visor-e1266850768252.jpg",
    password: 'password'
  })

handball_hannah = User.create!({
    first_name: "Henry Handball",
    last_name: "Smith",
    email: "handball_hannah@example.com",
    gender: "female",
    age: rand(18..40),
    bio: "Just moved to SF from Hungary, and hoping to find friends and gym space for some friendly handball games.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.olympic.org/Assets/MediaPlayer/Photos/2012/London/Handball/04_08_12_handball_01_sd.jpg",
    password: 'password'
  })

hiking_harry = User.create!({
    first_name: "Harry Hiker",
    last_name: "Smith",
    email: "hiking_harry@example.com",
    gender: "female",
    age: rand(18..40),
    bio: "I spent last summer hiking the Appalachian trail, and just moved to the city. Looking for friends to explore the local trails in Marin and the east bay.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://farm4.static.flickr.com/3508/3871896186_ede8169835.jpg",
    password: 'password'
  })

ping_pong = User.create!({
    first_name: "Ping Pong",
    last_name: "Smith",
    email: "ping_pong@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I was captain of the Ping Pong club in college.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://cdn.evbuc.com/eventlogos/28972529/pingpong.jpg",
    password: 'password'
  })

racquet_roger = User.create!({
    first_name: "Rocket Roger",
    last_name: "Smith",
    email: "racquet_roger@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I've reserved court time at the Olympic Club every Thursday at 7pm, and would love to find a few other racquetball enthusiasts.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.jewishjournal.com/images/featured/Art_Shay_Kill_Shot_ChicagoSide.jpg",
    password: 'password'
  })

rock_climing_rachel = User.create!({
    first_name: "Rachel Roche",
    last_name: "Smith",
    email: "rock_climing_rachel@example.com",
    gender: "female",
    age: rand(18..40),
    bio: "You can find me most weeknights at Planet Granite in the Marina, but I'm really interested in finding some outdoor climbing partners.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://s-media-cache-ak0.pinimg.com/236x/e0/7a/ca/e07aca14f0c77283688666ed5858f0e3.jpg",
    password: 'password'
  })

running_rena = User.create!({
    first_name: "Rena Runner",
    last_name: "Smith",
    email: "running_rena@example.com",
    gender: "female",
    age: rand(18..40),
    bio: "Currently training for the Nike Women's marathon in October.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.active.com/Assets/Running/580/timing-your-run-580.jpg",
    password: 'password'
  })

sailing_sam = User.create!({
    first_name: "Sailor Sam",
    last_name: "Smith",
    email: "sailing_sam@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I live on my yacht. It gets lonely.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://global.ralphlauren.com/SiteCollectionImages/polo/style/questions/0809_summerwhites_lg.jpg",
    password: 'password'
  })

skiergal = User.create!({
    first_name: "Lindsey VonnSkier",
    last_name: "Smith",
    email: "skiergal@example.com",
    gender: "female",
    age: rand(18..40),
    bio: "So excited that Tahoe finally has snow again this year. I have a pass at Squaw Valley, and stay in a ski lease in Tahoe Donner.",
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
    bio: "Grew up in Park City, UT. Just moved to the east bay and looking to do a few weekends in Tahoe this winter.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://d1vh373dea9f1i.cloudfront.net/blog/wp-content/uploads/Torah-Bright.jpg",
    password: 'password'
  })

squash_snap = User.create!({
    first_name: "Snap That Squash",
    last_name: "Smith",
    email: "squash_snap@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I started a company that teenagers love, but what I really love is playing squash. Finding cour time used to be hard, so I built myself a court in my backyard in Pac Heights.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.timeoutabudhabi.com/images/content/squash_in_abu_dhabi/innerbig/2013_1_squash_innerbig.jpg",
    password: 'password'
  })

surfer_sam = User.create!({
    first_name: "Surfer Sal",
    last_name: "Smith",
    email: "surfer_sam@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "I graduated from UC Santa Cruz in 2015, and spend my weekends chasing swells.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://www.vivaboo.com/wp-content/uploads/2010/10/surfer-surfing.jpg",
    password: 'password'
  })

tennis_gal = User.create!({
    first_name: "Tanya Tenis",
    last_name: "Smith",
    email: "tennis_gal@example.com",
    gender: "female",
    age: rand(18..40),
    bio: "I played varsity tennis in high school in Houston, and moved to SF after college in 2010...",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://lh5.googleusercontent.com/7dAaPmzgkuRkaZjLZHOaAS8iXx3in-ku3P9oPB55b2ZJznZldIhQ64jjgJUSg-REbPSJrNmx-j2aV8rSdO6UD4gbiu2rIbHzlvULreJq0mngTqiroDJEHi7jbrmD5sTi58hBIek",
    password: 'password'
  })

wrestling_will = User.create!({
    first_name: "Lucha Libre",
    last_name: "Smith",
    email: "wrestling_will@example.com",
    gender: "male",
    age: rand(18..40),
    bio: "While I no longer wear sweat suits like I did for high school wrestling, I still love the sport and have entered in a few adult league tournaments over the past few years.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "https://unitedworldwrestling.org/sites/default/files/media/image/article/img_0017.jpg",
    password: 'password'
  })

yogie = User.create!({
    first_name: "Ysabel Yogie",
    last_name: "Smith",
    email: "yogie@example.com",
    gender: "female",
    age: rand(18..40),
    bio: "Restorative yoga saved my life in 2008, and I love finding new friends to share my passion.",
    location: "San Francisco",
    latitude: 37.7576792,
    longitude: -122.5078123,
    profile_picture_url: "http://data.whicdn.com/images/47685733/superthumb.jpg",
    password: 'password'
  })

#Add 3 activities for all seed athletes (their natural sport, billiards, and two other random ones.)
seed_activity_ids = (1..22).to_a
seed_activity_ids.each do |activity_id|
    activity_name = Activity.find(activity_id).name
    ActivityBlurb.create!({
    text: ['beginner','intermediate','advanced'].sample,
    activity_id: activity_id,
    user_id: activity_id
    })
    current_activity = []
    current_activity.push(activity_id)
    other_activity_ids = seed_activity_ids - current_activity
    2.times do ActivityBlurb.create!({
      text: ['beginner','intermediate','advanced'].sample,
      activity_id: other_activity_ids.sample,
      user_id: activity_id
      })
      end
    ActivityBlurb.create!({
      text: ['beginner','intermediate','advanced'].sample,
      activity_id: 1,
      user_id: activity_id
      })
end

new_activities = ['archery','arm wrestling','atv','australian rules football','backcountry skiing / snowboarding','badminton','barre class','base jumping','baseball','basketball','beer pong','bmx','boardercross','bobsledding','boxing','broomball','canoeing','crew / rowing','cricket','croquet','cross-fit','curling','dirtbiking','dodgeball','dogsledding','fencing','field hockey','figure skating','fishing','flag football','four square','gaelic football','grand prix racing','gymnastics','hang gliding','high jump','hopscotch','horseback riding / equestrian','horseshoes','hunting','hurdles','hurling','ice climbing','ice dancing','ice hockey','javelin','judo','karate','kayaking','kickball','kickball','kickboxing','kite surfing','kung fu','lacrosse','laser tag','long jump','luge','lumberjack / woodsman','martial arts','motocross','mountain biking','nascar','nordic / cross-country skiing','paintball','parasailing','parkour','quidditch','roller derby','rugby','shot put / discus','skateboarding','skeet shooting','skiercross','skydiving','snorkeling','soccer','softball','speed skating','spikeball','swimming','taekwondo','triathalon','ultimate frisbee','volleyball','wakeboarding','water polo','water skiing','weightlifting','white water rafting','windsurfing']

new_activities.each do |activity|
  activities << Activity.create!(name: activity)
end

# Create Tom
tom = User.create!({
                    first_name: "Tom",
                    last_name: "Likes Everyone",
                    email: 'tom@myspace.com',
                    gender: 'male',
                    age: 40,
                    bio: 'Welcome to EverythingButSex. I will be your friend for everything but sex.',
                    location: "San Francisco",
                    latitude: 37.7576792,
                    longitude: -122.5078123,
                    profile_picture_url: "http://www.eonline.com/eol_images/Entire_Site/2015518/rs_600x600-150618104510-600.tom-myspace.jw.61815_2.jpg",
                    password: 'password'
                      })

activities.each_with_index do |activity, index|
  ActivityBlurb.create!({
      # text: "I've been playing #{activity} since 1999.",
      text: ['beginner','intermediate','advanced'].sample,
      activity_id: index,
      user_id: 1
      })
end

#everyone swipes on you (run for each seeded team member)
def everyone_swipes_you
  seed_users = User.where("id <= 22")
  you = User.last
  seed_users.each do |user|
      Swipe.create!({
        swiped_yes: [true,false].sample,
        swiper_id: user.id,
        swipee_id: you.id
        })
  end
end

def tom_likes_everyone
  seed_users = User.where.not(id: 23)
  seed_users.each do |user|
      Swipe.create!({
        swiped_yes: true,
        swiper_id: 23,
        swipee_id: user.id
        })
  end
end

#create Nil's Test FB Account PHOTOS
nil_thacker = User.create!({
                  first_name: "Nil",
                  last_name: "Thacker",
                  email: "nil@nil.gs",
                  gender: "male",
                  age: rand(25..35),
                  bio: "Learned to code and play at DBC.",
                  location: "San Francisco",
                  latitude: 37.7576792,
                  longitude: -122.5078123,
                  profile_picture_url: "http://graph.facebook.com/10153470272907149/picture?type=large",
                  password: 'password'
                    })

(1..3).to_a.each do |activity_id|
  ActivityBlurb.create!({
    text: ['beginner','intermediate','advanced'].sample,
    activity_id: activity_id,
    user_id: nil_thacker.id
    })
  end
#create Brian's Test FB Account
test_user = User.create!({
                  first_name: "Sherrif Walker",
                  last_name: "DBC Ranger",
                  email: "rentmasters.sf@gmail.com",
                  gender: "male",
                  age: rand(25..35),
                  bio: "Learned to code and play at DBC.",
                  location: "San Francisco",
                  latitude: 37.7576792,
                  longitude: -122.5078123,
                  profile_picture_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAALDAAAAJDI1MGQ0ZDFhLWM5MTktNDY3Yy04MDE1LWFlYTRjYzZhOGQ5MA.jpg",
                  password: 'password'
                    })

(1..10).to_a.each do |activity_id|
  ActivityBlurb.create!({
    text: ['beginner','intermediate','advanced'].sample,
    activity_id: activity_id,
    user_id: test_user.id
    })
  end

  #everyone swipes Test
  everyone_swipes_you

=begin

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
    activity_id: 16,
    user_id: brian.id
    })

(1..1).to_a.each do |activity_id|
  ActivityBlurb.create!({
    text: "I'm really good at bar games, at least the drinking part.",
    activity_id: activity_id,
    user_id: brian.id
    })
  end

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

(1..1).to_a.each do |activity_id|
  ActivityBlurb.create!({
    text: "I'm really good at bar games, at least the drinking part.",
    activity_id: activity_id,
    user_id: nil_thacker.id
    })
  end

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

(1..1).to_a.each do |activity_id|
  ActivityBlurb.create!({
    text: "I'm really good at bar games, at least the drinking part.",
    activity_id: activity_id,
    user_id: trevor.id
    })
  end

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

(1..1).to_a.each do |activity_id|
  ActivityBlurb.create!({
    text: "I'm really good at bar games, at least the drinking part.",
    activity_id: activity_id,
    user_id: abe.id
    })
  end
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

(1..1).to_a.each do |activity_id|
  ActivityBlurb.create!({
    text: "I'm really good at bar games, at least the drinking part.",
    activity_id: activity_id,
    user_id: greg.id
    })
  end

#everyone swipes Greg
everyone_swipes_you

=end

#SEED MATCHES AMONG TEST_USER and Tom
tom_likes_everyone

#TEST_USER likes Tom
Swipe.create!({
    swiped_yes: true,
    swiper_id: 24, #test_user id
    swipee_id: 23 #Tom
    })

#Tom and Test User exchange a bunch of messages
matched_activity = Activity.select("name").sample.name

Message.create!(
    match_id:1,
    message_text: "Hi #{test_user.first_name}, want to play #{matched_activity} this weekend?",
    user_id:23,
    sender_name:"Tom")

Message.create!(
    match_id:1,
    message_text: "Hi #{tom.first_name}, I could be interested. What's your background in #{matched_activity}?",
    user_id:24,
    sender_name:"Walker, DBC Ranger")

Message.create!(
    match_id:1,
    message_text: "I started playing #{matched_activity} in 2007 when it was cool, and never moved on.",
    user_id:23,
    sender_name:"Tom")

Message.create!(
    match_id:1,
    message_text: "Interesting. I'm a complete newb, but would love to learn more.",
    user_id:24,
    sender_name:"Walker, DBC Ranger")

Message.create!(
    match_id:1,
    message_text: "How's tomorrow?",
    user_id:23,
    sender_name:"Tom")
