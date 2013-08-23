# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ryanUser = User.find_or_create_by(login: "ryan", password: "ryan")

ryanProfile = Profile.find_or_create_by(
  user: ryanUser, 
  firstname: "Ryan", 
  lastname: "Hirsch", 
  dob: Date.new(1984, 11, 19),
  streetaddress: "818 Cone Flower Dr",
  state: "IL",
  zipcode: "62298",
  gender: "M",
  email: "ryan.hirsch@gmail.com"
)

firstTerm = Term.find_or_create_by(
  name: "Full Year 2013-2014",
  start_date: Date.new(2013, 8, 20),
  end_date: Date.new(2014, 5, 30),
  code: "SY2013"
)

elementary = Department.find_or_create_by(name: "Elementary")

student = Role.find_or_create_by(name: "Student")
teacher = Role.find_or_create_by(name: "Teacher")


secondGrade = Course.find_or_create_by(
  name: "Second Grade",
  code: "2nd Grade",
  department: elementary
)

secondGradeSection = Section.find_or_create_by(
  name: "2nd Grade 2013-2014",
  course: secondGrade,
  term: firstTerm
)

enrollRyan = Enrollment.find_or_create_by(
  role: student,
  section: secondGradeSection,
  profile: ryanProfile
)