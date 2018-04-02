require_relative('../models/member')

Member.delete_all

member1 = Member.new({'name' => 'Atom', 'salary' => 59000, 'github' => 'something@github.com'})
member2 = Member.new({'name' => 'Tom', 'salary' => 79000, 'github' => 'gag@github.com'})
member3 = Member.new({'name' => 'John', 'salary' => 54000, 'github' => 'somethiga.com'})
member4 = Member.new({'name' => 'Lynda', 'salary' => 52000, 'github' => 'some@thub.com'})
member5 = Member.new({'name' => 'Geo', 'salary' => 55000, 'github' => 'some.com'})

member1.save
member2.save
member3.save
member4.save
member5.save
