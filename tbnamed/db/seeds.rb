#THIS SEED FILE CREATES THE FOLLOWING CONDITIONS
#30 users, with the first user being Tom
#Tom (user1) plays all activities, and has swiped yes on all users.
#Mark (user2) plays Racquetball, and has liked Tom, so they are a match.


# Create activities
activity_names = ['Tennis', 'Golf', 'Racquetball']
activities = []
activity_names.each do |activity|
  activities << Activity.create(name: activity)
end

#Create Tom
tom = User.create!({
                    first_name: "Tom",
                    last_name: "Likes_Everyone",
                    email: 'tom@myspace.com',
                    username: 'tom',
                    gender: 'Male',
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
                    username: 'mark',
                    gender: 'Male',
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
      activity_id: 3,
      user_id: 2
      })

# Create other users
28.times do
  # random = [true, false].sample

  user = User.create!({
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    username: Faker::Name.first_name,
                    gender: ['m','f'].sample,
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
      activity_id: [1,2,3].sample,
      user_id: user.id
      })
end

#Tom likes all users

(2..30).each do |swipee_id|
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

#FOR TESTING User.matches method
    #Mark likes User3
    # Swipe.create!({swiped_yes: true, swiper_id: 2, swipee_id: 3})

    # #User3 likes Mark
    # Swipe.create!({swiped_yes: true, swiper_id: 2, swipee_id: 3})


    # #User10 likes User9 (bug behavior: when User9 swipes yes, user 10 will not see it as a first_user match)
    # Swipe.create!({swiped_yes: true, swiper_id: 10, swipee_id: 9 })



#Mark sends Tom a message
message = Message.create({
  match_id: 1,
  user_id: 2,
  message_text: "Want to play Racquetball this weekend?"
  # message_text: Faker::Hipster.sentences(2).join(' ')
  })
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
