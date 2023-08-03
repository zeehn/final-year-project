# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#k   Character.create(name: "Luke", movie: movies.first)
ABOUT_MIN_WORDS = 200

def generate_about_text
  # Custom text for generating the "about" section
  about_text = <<~ABOUT
    I am an experienced and dedicated maid, committed to providing top-notch cleaning services to my clients. With years of experience in the industry, I take pride in delivering exceptional results and ensuring customer satisfaction.

    My cleaning services cover a wide range of areas, including residential homes, offices, and commercial spaces. I am well-versed in using various cleaning techniques, tools, and products to achieve the best possible outcomes. From vacuuming and dusting to mopping floors and sanitizing surfaces, I am meticulous in my approach to cleaning.

    Attention to detail is my forte, and I strive to leave every space sparkling clean and organized. I understand that each client has unique needs and preferences, so I adapt my cleaning methods accordingly. Whether you require a one-time deep clean or regular maintenance, I am here to assist you.

    In addition to my cleaning skills, I am reliable, trustworthy, and respectful of your privacy and personal belongings. I maintain a professional demeanor and prioritize punctuality. You can rely on me to arrive on time and complete the cleaning tasks efficiently.

    Customer satisfaction is of utmost importance to me. I value open communication and actively listen to your feedback and specific instructions. Your happiness is my ultimate goal, and I go the extra mile to ensure that you are delighted with my services.

    When I'm not cleaning, I enjoy spending time outdoors, reading, and staying active. I believe in maintaining a healthy work-life balance, which helps me approach each cleaning job with renewed energy and enthusiasm.

    If you're looking for a skilled and dependable maid who will make your space shine, look no further. Contact me today to discuss your cleaning needs and schedule an appointment. I look forward to working with you!
  ABOUT

  # Check if the generated about_text has enough words
  words = about_text.split.size
  about_text += ' ' + generate_about_text if words < ABOUT_MIN_WORDS

  about_text
end

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: '.')
  password = "Secret"
  address = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state
  zip = Faker::Address.zip_code
  hourly_rate = Faker::Number.between(from: 10, to: 50)
  about = generate_about_text
  
  Maid.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
    address: address,
    city: city,
    state: state,
    zip: zip,
    hourly_rate: hourly_rate,
    about: about
  )
end
=begin 
  10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: '.')
  password = Faker::Internet.password
  address = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state
  zip = Faker::Address.zip_code
  hourly_rate = Faker::Number.between(from: 10, to: 50)
  about = Faker::Lorem.paragraph(sentence_count: 3)
  
  Maid.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
    address: address,
    city: city,
    state: state,
    zip: zip,
    hourly_rate: hourly_rate,
    about: about
  )
end
=end
