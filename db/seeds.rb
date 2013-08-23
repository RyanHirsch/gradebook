# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ryanUser = User.find_or_create_by(login: "ryan", password: "ryan")
andiUser = User.find_or_create_by(login: "andi", password: "andi")


ryanProfile = Profile.find_or_create_by(
  display_name: "Ryan",
  user: ryanUser, 
  first_name: "Ryan", 
  last_name: "Hirsch", 
  dob: Date.new(2004, 11, 19),
  streetaddress: "818 Main Street",
  state: "IL",
  zipcode: "62298",
  gender: "male",
  email: "ryan.hirsch@gmail.com"
)

andiProfile = Profile.find_or_create_by(
  display_name: "Mrs. Hirsch",
  user: andiUser, 
  first_name: "Andi", 
  last_name: "Hirsch", 
  dob: Date.new(1987, 8, 20),
  streetaddress: "808 Main Street",
  state: "IL",
  zipcode: "62298",
  gender: "female",
  email: "mrs.hirsch@gmail.com"
)

firstTerm = Term.find_or_create_by(
  name: "Full Year 2013-2014",
  start_date: Date.new(2013, 8, 20),
  end_date: Date.new(2014, 5, 30),
  code: "SY2013"
)

elementary = Department.find_or_create_by(name: "Elementary")

departmentTypes = [
  { name: "Mathematics" },
  { name: "Science" },
  { name: "English" }
]

departmentTypes.each do |type|
  Department.find_or_create_by(type)
end

student = Role.find_or_create_by(name: "Student")
teacher = Role.find_or_create_by(name: "Teacher")
ta = Role.find_or_create_by(name: "TA")
observe = Role.find_or_create_by(name: "Observer")

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

enrollAndi = Enrollment.find_or_create_by(
  role: student,
  section: secondGradeSection,
  profile: andiProfile
)
assignments = [
  { name: "Test" },
  { name: "Quiz" },
  { name: "Assignment" },
  { name: "Assessment" },
  { name: "Participation" }
]

assignments.each do |type|
  AssignmentType.find_or_create_by(type)  
end

Assignment.create(
  name: "Example Test",
  total: 10,
  section: Section.first,
  assignment_type: AssignmentType.find_by(name: "Test")
)

Grade.create(value: 9,
  enrollment: Profile.find_by(first_name: "Ryan").enrollments.first,
  assignment: Assignment.first
)



