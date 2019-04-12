# README

## Please Note:

-   if you want to create a course via postman you can use something like this:
    url will be : http://127.0.0.1:3000/courses
    your body like : {"course":{"name":"math4","number":"323987"} }

    ## Note:

          - Make sure that the header of the request ===> Content-Type:application/json

-   if you want to update a course
    url will be like: http://127.0.0.1:3000/courses/id => please remember to remove id and put the number you want

    your body like : {"course":{"name":"math2","number":"101","student_ids":[1,2],"teacher_ids":[1,2]} } ==> please note that the number must be integer and where student_ids and teacher_ids are the IDs that you want to associate the course to them and let the associated with that course

# Last Note:

    you can make the above process with student and teacher also,
    except you will use course_ids instead of both student_ids and teacher_ids
