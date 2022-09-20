# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{title: 'Ruby'}, {title: 'JavaScript'}, {title: 'Python'}])
users = User.create([{name: 'Ilia'}, {name: 'Alex'}, {name: 'John'}])

tests = Test.create([
  {title: 'Euismod nisi porta', author_id: users.first.id, category_id: categories.first.id, level: 5},
  {title: 'Est pellentesque elit ullamcorper', author_id: users.second.id, category_id: categories.second.id, level: 2},
  {title: 'Feugiat vivamus at', author_id: users.last.id, category_id: categories.last.id, level: 8}
])

questions = Question.create([
  {body: 'Nisl nunc mi ipsum faucibus vitae aliquet?', test_id: tests.first.id},
  {body: 'Lobortis feugiat vivamus at augue?', test_id: tests.second.id},
  {body: 'Feugiat vivamus at augue?', test_id: tests.last.id}
])

answers = Answer.create([
  {body: 'yes', question_id: questions.first.id, correct: false},
  {body: 'no', question_id: questions.first.id, correct: true},
  {body: 'yes', question_id: questions.second.id, correct: false},
  {body: 'no', question_id: questions.second.id, correct: true},
  {body: 'yes', question_id: questions.last.id, correct: false},
  {body: 'no', question_id: questions.last.id, correct: true}
])

started_tests = StartedTest.create([
  {user_id: users.first.id, test_id: tests.first.id},
  {user_id: users.first.id, test_id: tests.second.id},
  {user_id: users.first.id, test_id: tests.last.id},
  {user_id: users.second.id, test_id: tests.first.id},
  {user_id: users.second.id, test_id: tests.second.id},
  {user_id: users.second.id, test_id: tests.last.id},
  {user_id: users.last.id, test_id: tests.first.id},
  {user_id: users.last.id, test_id: tests.second.id},
  {user_id: users.last.id, test_id: tests.last.id}
])

# lorem_ipsum = %w[
#   euismod nisi porta lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor id eu 
#   nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam eget felis
#   eget nunc lobortis mattis aliquam faucibus purus in massa tempor nec feugiat nisl pretium 
#   fusce id velit ut tortor pretium viverra suspendisse potenti nullam ac tortor vitae purus 
#   faucibus ornare suspendisse sed nisi lacus sed viverra tellus in hac habitasse platea 
#   dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt 
#   lobortis feugiat vivamus at augue eget arcu dictum varius duis at consectetur lorem donec 
#   massa sapien faucibus et molestie
# ]

# categories = Category.create([{title: 'Ruby'}, {title: 'JavaScript'}, {title: 'Python'}])
# users = User.create([{name: 'Ilia'}, {name: 'Alex'}, {name: 'John'}])
# tests = []
# 20.times do
#   tests << Test.create!(
#     title: lorem_ipsum.sample(3).join(' ').capitalize, 
#     author_id: users.sample.id, 
#     category_id: categories.sample.id, 
#     level: Random.random_number(10)
#     )
# end

# questions = []
# 120.times do
#   questions << Question.create!(
#     body: lorem_ipsum.sample(Random.rand(5..10)).join(' ').capitalize + '?',
#     test_id: tests.sample.id
#   )
# end

# answers = []
# 4.times do |u|
#   120.times do |i|
#     answers << Answer.create!(
#       body: lorem_ipsum.sample(Random.rand(2..5)).join(' ').capitalize,
#       correct: u == 3 ? true : false,
#       question_id: i + 1
#     )
#   end
# end

# 30.times do
#   StartedTest.create!(
#     user_id: users.sample.id,
#     test_id: tests.sample.id
#   )
# end
