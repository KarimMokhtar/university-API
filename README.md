# README

## Please Note:

-   if you want to create a course via postman you can use something like this:
    url will be : http://127.0.0.1:3000/courses
    your body like : {"course":{"name":"math4","number":"323987"} }

    ## Note:

          - Make sure that the header of the request ===> Content-Type:application/json

-   if you want to update a course
    url will be like: http://127.0.0.1:3000/courses/id => please remember to remove id and put the number you want
    your body like : {"course":{"name":"new value","number":"new value"} } ==> please note that the number must be integer

# Last Note:

    you can make the above process with student and teacher also.
