# CS 262 Monopoly Webservice

Used By: Andrew Baker

Date: 11.6.20

This is the data service application for the [CS 262 sample Monopoly project](https://github.com/calvin-cs262-organization/monopoly-project) 
and it is deployed here:
          
<https://fathomless-eyrie-37324.herokuapp.com/>

It is based on the standard Heroku with Node.js tutorial.

<https://devcenter.heroku.com/articles/getting-started-with-nodejs>  

The database is relational with the schema specified in the `sql/` sub-directory,
 and is hosted on [ElephantSQL](https://www.elephantsql.com/). The database user
and password are stored as Heroku configuration variables rather than in this (public) repo.

We implement this sample as a separate repo to simplify Heroku integration, but 
for lab 9, you can simply submit your code under the standard `cs262/lab09` directory. 
For the team project, configure your Heroku app to auto-deploy the code from the
master/main branch of your
service repo; do this by following the instructions under the &ldquo;Deploy&rdquo; 
tab in your application in the Heroku dashboard.
 
* What are the (active) URLs for your data service?\s\s
<https://fathomless-eyrie-37324.herokuapp.com/games>

* Which of these endpoints implement actions that are idempotent? nullipotent?\s\s
The link above is both idempotent and nullipotent. This is to say that the endpoints have no effect if they are not run, and also have no effect no matter how many times they are run. Neither have any new result or change to the endpoint. 

router.get //nullipotent
router.put //idempotent
router.post //neither idempotent or nullpotent
router.delete //idempotent

* Is the service RESTful? If not, why not? If so, what key features make it RESTful.\s\s
This service is restful, as it implements to common http methods, get, post, delete, and put. 

* Is there any evidence in your implementation of an impedance mismatch?\s\s
The differences between the tables and the classes, lead me to believe that there is an impedance mismatch.