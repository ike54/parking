#Parking Application

This is parking spot locator application for Data Mining at Texas State
the application has the name 'Parking' until further development and a name is chosen.
by [Isaac Karrer](https://twitter.com/bigike54)

To Do List
==========
- Create an active mailer to confirm a user has a Texas State email address
    - Add Confirmation Code and Confrimed fields to user model
    - Add controller method to user controller which expects a User Id and Confrimation Code
        - If Confirmation Code and User Id match, set Confirmed to True
    - Create a route ex. users/1/confirm/code which maps to controller method
    - Create action mailer template which accepts User Id as parameter
        - Send link to confirm route
    - Use and observer to generate a Confirmation Code on new accounts
    - Create a helper method to check if a User Id is confirmed
- Create table and models for parking lot perimeters with GPS coordinates
    - What datatype and how many points to use to establish parking lot perimeter?
- Create table and models for parkers queueing statistics
	- Example fields:
	    - Parking lot Id
	    - User Id
	    - Time enqueued
	    - Time spot found
	    - Time left spot
	    - Park aborted
	    - GPS location
- Create table and models for open spots reported
        - Parking lot Id
        - User Id
        - GPS Location
        - Time reported open
- Create RESTful API for all controller methods except for ones which require an admin user, e.g. delete
- Create Android view for sending REST API requests for user registration, login, Request to Park, Abort Park, Parked, Open Spot Found, etc.