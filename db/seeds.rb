# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Room.create!(number:'1',size:'Small',location:'James.B.Hunt')
Room.create!(number:'2',size:'Small',location:'D.H.Hill')
Room.create!(number:'3',size:'Medium',location:'James.B.Hunt')
Room.create!(number:'4',size:'Large',location:'James.B.Hunt')
Room.create!(number:'5',size:'Small',location:'James.B.Hunt')
Room.create!(number:'6',size:'Medium',location:'D.H.Hill')
Room.create!(number:'7',size:'Large',location:'James.B.Hunt')
Room.create!(number:'8',size:'Small',location:'James.B.Hunt')
Room.create!(number:'9',size:'Large',location:'D.H.Hill')
Room.create!(number:'10',size:'Medium',location:'James.B.Hunt')
Room.create!(number:'11',size:'Medium',location:'D.H.Hill')
Room.create!(number:'12',size:'Large',location:'James.B.Hunt')


