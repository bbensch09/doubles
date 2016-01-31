#THIS SEED FILE CREATES THE FOLLOWING CONDITIONS
#30 users, with the first user being Tom
#Tom (user1) plays all activities, and has swiped yes on all users.
#Mark (user2) plays Racquetball, and has liked Tom, so they are a match.


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

  ActivityBlurb.create!({
      text: "sample text about activity",
      activity_id: (1..10).to_a.sample
      user_id: user.id
      })
  ActivityBlurb.create!({
      text: "sample text about activity",
      activity_id: (11..20).to_a.sample
      user_id: user.id
      })
end

#create Brian, Abe, Nil, Trevor, Greg as Users
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
    text: "I've been skiing since I was 5 and rent a Tahoe house near Squaw every winter.",
    activity_id: 15,
    user_id: brian.id
    })


#Tom likes all users

Users.all.each do |swipee_id|
  Swipe.create!({
    swiped_yes: true,
    swiper_id: 1,
    swipee_id: swipee_id
    })
end


#Mark likes Tom
Swipe.create!({
  swiped_yes: true,
  swiper_id: 2,
  swipee_id: 1
  })

#Mark sends Tom a message
message = Message.create({
  match_id: 1,
  user_id: 2,
  message_text: "Want to play Racquetball this weekend?"
  # message_text: Faker::Hipster.sentences(2).join(' ')
  })
