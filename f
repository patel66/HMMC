
[1mFrom:[0m /vagrant/hccmgrup/HMMC/lib/hmmc/use_cases/add_miles_class.rb @ line 10 HMMC::AddMilesClass#run:

     [1;34m3[0m: [32mdef[0m [1;34mrun[0m(inputs)
     [1;34m4[0m:   school_id = inputs[[33m:school_id[0m]
     [1;34m5[0m: 
     [1;34m6[0m: 
     [1;34m7[0m:   classroom = inputs[[33m:classroom[0m]
     [1;34m8[0m:   milesclassroom = inputs[[33m:milesclass[0m]
     [1;34m9[0m: 
 => [1;34m10[0m:   binding.pry
    [1;34m11[0m:   retreived_classroom = [1;34;4mHMMC[0m.db.get_class_by_name(classroom) [1;30m# problem is, create class here[0m
    [1;34m12[0m: 
    [1;34m13[0m:   [1;30m# return failure(:no_school_with_that_id) if HMMC.db.get_school(school_id) == nil[0m
    [1;34m14[0m:   [32mreturn[0m failure([33m:can_not_add_more_then_100[0m) [32mif[0m inputs[[33m:milesclass[0m] >= [1;34m100[0m
    [1;34m15[0m: 
    [1;34m16[0m:   retreived_school = [1;34;4mHMMC[0m.db.get_school(school_id) [1;30m# problem 2, create a school here[0m
    [1;34m17[0m:   classrooms_school = [1;34;4mHMMC[0m.db.get_classrooms_for_school(school_id)
    [1;34m18[0m: 
    [1;34m19[0m:   retreived_school.add_classroom(retreived_classroom) [1;30m# classroom is already here, so add twice?[0m
    [1;34m20[0m: 
    [1;34m21[0m:   classrooms_school.each [32mdo[0m |room|
    [1;34m22[0m:     retreived_school.add_classroom(room)
    [1;34m23[0m:     retreived_school.add_miles(room)
    [1;34m24[0m:   [32mend[0m
    [1;34m25[0m: 
    [1;34m26[0m:  [1;30m# retreived_classroom.add_miles(milesclassroom)[0m
    [1;34m27[0m:   retreived_school.total_miles
    [1;34m28[0m:   success([33m:miles[0m => milesclassroom, [33m:school[0m => retreived_school)
    [1;34m29[0m: [32mend[0m

