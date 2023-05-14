# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

gym1 = Gym.create!(name: "Movement",
  member_cost: 92,
  guest_cost: 25,
  in_colorado: true)
member1 = Member.create!(name: "Garrett",
  money_spent: 276,
  co_resident: true,
  gym_id: gym1.id)
member2 = Member.create!(name: "Audrey",
  money_spent: 184,
  co_resident: true,
  gym_id: gym1.id)
member3 = Member.create!(name: "Angie",
  money_spent: 92,
  co_resident: true,
  gym_id: gym1.id)
member4 = Member.create!(name: "Chris",
  money_spent: 92,
  co_resident: true,
  gym_id: gym1.id)

gym2 = Gym.create!(name: "The Spot",
  member_cost: 75,
  guest_cost: 20,
  in_colorado: true)
member5 = Member.create!(name: "Brad",
  money_spent: 150,
  co_resident: false,
  gym_id: gym2.id)
member6 = Member.create!(name: "Sarah",
  money_spent: 75,
  co_resident: false,
  gym_id: gym2.id)

gym3 = Gym.create!(name: "Benchmark ",
  member_cost: 125,
  guest_cost: 40,
  in_colorado: false)
member7 = Member.create!(name: "Brian",
  money_spent: 250,
  co_resident: false,
  gym_id: gym3.id)
member8 = Member.create!(name: "Sam",
  money_spent: 80,
  co_resident: false,
  gym_id: gym3.id)