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
"billiards / darts / foosball (bar games)","bocce ball","bowling","cycling","diving","frisbee golf","golf","handball","hiking","ping pong","racquetball","rock-climbing","running","sailing","skiing / snowboarding","squash","surfing","tennis","wrestling","yoga"]
activities = []
activity_names.each do |activity|
  activities << Activity.create(name: activity)
end

#Create Tom
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
      text: "I've been playing #{activity} since 1999.",
      activity_id: index,
      user_id: 1
      })
end

#create Mark
mark = User.create!({
                    first_name: "Mark",
                    last_name: "Likes_Harvard",
                    email: 'mark@facebook.com',
                    gender: 'male',
                    age: 40,
                    bio: 'I like to hack',
                    location: "Menlo Park",
                    latitude: 37.7576792,
                    longitude: -122.5078123,
                    profile_picture_url: "http://tctechcrunch2011.files.wordpress.com/2012/09/mark.jpeg",
                    password: 'password'
                      })

ActivityBlurb.create!({
      text: "I've been playing Racquetball since I dropped out of Harvard.",
      activity_id: 11,
      user_id: 2
      })

# Create other users
28.times do
  # random = [true, false].sample

  user = User.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      gender: ['male','female'].sample,
      age: rand(18..80),
      bio: Faker::Hipster.sentences(4).join(' '),
      location: "San Francisco",
      latitude: 37.7576792,
      longitude: -122.5078123,
      profile_picture_url: Faker::Avatar.image,
      password: 'password'
        })
end

User.all.each do |user|
  ActivityBlurb.create!({
    text: "sample text about activity",
    activity_id: (1..10).to_a.sample,
    user_id: user.id
    })
  ActivityBlurb.create!({
    text: "sample text about activity",
    activity_id: (11..20).to_a.sample,
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



#AUTOGENERATE MESSAGE WITH EACH MATCH from the original user
Match.all.each do |match|
  Message.create!({
  match_id: match.id,
  user_id: match.first_user_id,
  message_text: "(This message is auto generated): It's cool to see we have something in common. Want to meet up?"
  })
end
