require_relative('../models/member')

Member.delete_all

member1 = Member.new({'first_name' => 'Atom', 'last_name' => 'Editor', 'salary' => 59000, 'github' => 'something@github.com'})
member2 = Member.new({'first_name' => 'Tom', 'last_name' => 'Editor', 'salary' => 79000, 'github' => 'gag@github.com'})
member3 = Member.new({'first_name' => 'John', 'last_name' => 'Editor', 'salary' => 54000, 'github' => 'somethiga.com'})
member4 = Member.new({'first_name' => 'Lynda', 'last_name' => 'Editor', 'salary' => 52000, 'github' => 'some@thub.com'})
member5 = Member.new({'first_name' => 'Geo', 'last_name' => 'Editor', 'salary' => 55000, 'github' => 'some.com'})

member1.save
member2.save
member3.save
member4.save
member5.save
