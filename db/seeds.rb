puts 'Creating Users'
User.create!(
  name: 'David Harris',
  email: 'forbiddenvoid@gmail.com',
  password: 'Password'
)

User.create!(
  name: 'Ryan Collins',
  email: 'admin@ryancollins.io',
  password: 'Password',
  bio: 'Experienced Software Engineer specializing in implementing cutting-edge technologies in a multitude of domains, focusing on Front End Web Development and UI / UX.',
  avatar: 'https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAQyAAAAJDU3YWY4Nzk1LWQ0YzEtNGIyMy1iOWI3LTBmMTllMmI1Y2Q5NQ.jpg'
)

User.create!(
  name: 'Andreas Daimainger',
  email: 'andreas@gmail.com',
  password: 'Password',
  bio: 'I started to code about 2 years ago and have been very focused on developing cutting edge UI components. I have a passion for functional programming, and I love creating environments that make it easier for developers to write consistent, testable code.',
  avatar: 'https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAcWAAAAJDM2ZjBiYmMwLTk4ZmUtNGVkOC05MjYyLTMxMGI1ZmU1NTMyZQ.jpg'
)

User.create!(
  name: 'Demo User',
  email: 'demo@udacity.com',
  password: 'Password123!',
  bio: 'An amazing, but sadly fake user',
  avatar: 'http://data.whicdn.com/images/88776105/superthumb.jpg'
)

puts 'Creating tags'
tags = [
  'Software Engineering',
  'Open Source',
  'Mobile',
  'Web',
  'Machine Learning',
  'Data Analysis',
  'JavaScript',
  'React',
  'GraphQL',
  'Ruby on Rails'
]
10.times.each_with_index do |index|
  Tag.create!(
    tag: tags[index]
  )
end

puts 'Creating Spotlight Images'
SpotlightImage.create!(
  url: 'https://github.com/RyanCCollins/cdn/blob/master/alumni-webapp/Udacity-Self-Driving-Car-Engineer-Nanodegree-800x333.jpg?raw=true',
  user: User.first
)

SpotlightImage.create!(
  url: 'https://github.com/RyanCCollins/cdn/blob/master/alumni-webapp/VRDeveloperNanodegreeProgram.png?raw=true',
  user: User.first
)

SpotlightImage.create!(
  url: 'https://github.com/RyanCCollins/cdn/blob/master/alumni-webapp/deeplearning.jpg?raw=true',
  user: User.first
)

SpotlightImage.create!(
  url: 'https://github.com/RyanCCollins/cdn/blob/master/alumni-webapp/seniorweb.gif?raw=true',
  user: User.first
)

puts 'Creating articles'
statuses = *(0..2)
spotlighted_count = 0
10.times do
  title = FFaker::HealthcareIpsum.words.map(&:capitalize).join(' ')
  featured = [true, false, false].sample
  spotlighted_options = [true, false].sample
  if spotlighted_options && spotlighted_count <= 3
    spotlighted_count += 1
    spotlighted = true
  else
    spotlighted = false
  end
  Article.create!(
    user: User.all.sample,
    title: title,
    featured: featured,
    spotlighted: spotlighted,
    status: statuses.sample,
    content: FFaker::HealthcareIpsum.paragraph,
    feature_image: FFaker::Avatar.image,
    tags: Tag.all.sample(4).uniq(&:tag)
  )
end
