require_relative('../models/member')

member1 = Member.new({'name' => 'Atom', 'salary' => 59, 'github' => 'something@github.com'})

member1.save
