# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'

course_input = File.read('db/course.json')
courses = JSON.parse(course_input)

subject_input = File.read('db/subject.json')
subjects = JSON.parse(subject_input)

instructor_input = File.read('db/instructor.json')
instructors = JSON.parse(instructor_input)

#puts instructors.length

#Instructor.create(first: "Jon", middle: "middle")

subjects.each do |s|
  Subject.create(name: s["name"], abb: s["abbreviation"], sub_id: s["id"], segments: s["segments"])
end

courses.each do |c|
  Course.create(name: c["name"], credit: c["credit"], requirement: c["requirement"], description: c["description"], c_id: c["id"], code: c["code"])
end

instructors.each do |ins|
  Instructor.create(first: ins["first"], middle: ins["middle"], last: ins["last"], email: ins["email"], ins_id: ins["id"])
end
