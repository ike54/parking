######Note, the three links above will give a 404 error if you are not logged into Github and have not been invited by Isaac Karrer as a collaborator.

#Parking Application
A Ruby on Rails web application is proposed as a backend for the mobile user interface.  A RESTful API will be added so that an Android mobile app may request data and login.


The starting point from this application is from the repository [SampleApp](https://github.com/ike54/sampleApp).  The working web application, SampleApp may be viewed [here](https://blooming-falls-1904.herokuapp.com/) (the application must wake up, patience please).  SampleApp is the result of Isaac Karrer engaging in the [*Ruby on Rails Tutorial*](http://railstutorial.org/) by [Michael Hartl](http://michaelhartl.com/).  Once the Microposts model, table and tests are removed all that remains is an application where users may register, login, change passwords, and choose an avatar via gravatar.
- When a user requests to park, user parking history would be used to list the probability to find a spot in their preferred lot.  Lots in close proximitity to the preferred lot and their probabilities could also be listed.
    - The GPS coordinates could also be used to estimate the time it would take for a user to travel from the location where they requeseted to park, to their parking spot in a chosen lot.
    - Combining the estimated time to reach the requested lot, the number of users currently en route to the lot, the number of people per time segment who successfully find a spot, and the number of people who could not find a spot and aborted a parking attempt per time segment, a probabilty to find a spot for that moment could be calculated.
- When a user parks, GPS coordinates may be used to create a prioritized list of the parking lots in which the user may be currently located, with an option to select the parking lot from a full list if the parking lot does not appear in the original list.
    - The list would be used to confirm which lot the user found a spot to park in. Additionally the list could be used when the user has found open spots while walking through the parking lot.
    - A user's parking spot may be located on the border between two lots.  GPS on an Android device is not accurate enough to determine which lot a person is located.
- Table and models for parking lot perimeters with GPS coordinates will be created
    - What datatype and how many points to use to establish parking lot perimeter?
- Table and models for parker's queueing statistics will be created
	- Example fields:
	    - Parking lot Id
	    - User Id
	    - Time enqueued
	    - Time spot found successfully
	    - Time left spot
	    - Park aborted time
	    - GPS location when spot requested
	    - GPS location when successfully parked
- Table and models for open spots reported will be created
    - Example fields:
        - Parking lot Id
        - User Id
        - GPS Location of reported spot
        - Time reported open
- To prevent malicious users submitting unreliable data, only users with a texas state email will be allowed to register for the application

#To Do List
- Create RESTful API for all controller methods except for ones which require an admin user, e.g. delete
- Create Android application for sending REST API requests for user registration, login, password recovery, Request to Park, Abort Park, Parked, Open Spot Found, etc.
- Remove Microposts
- Remove ability to change email login
- Create ability to recover password
- Add a validation that the user's email ends in @txstate.edu
- (optional) Create an active mailer to confirm a user has a Texas State email address or to recover a password (further validates that the user has an active texas state email)
    - Add Confirmation Code and Confrimed fields to user model
    - Add controller method to user controller which expects a User Id and Confrimation Code
        - If Confirmation Code and User Id match, set Confirmed to True
    - Create a route ex. users/1/confirm/code which maps to controller method
    - Create action mailer template which accepts User Id as parameter
        - Send link to confirm route
    - Use and observer to generate a Confirmation Code on new accounts
    - Create a helper method to check if a User Id is confirmed
- Create tables for parking data logging
- Implement Data Mining logic to populate proposed lists
