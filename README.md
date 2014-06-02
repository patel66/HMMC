HMMC
====

Hosted at: <http://hmmc.herokuapp.com/>

Hundred Million Mile Challenge 

An exercise app for logging amount of miles as well as number of students participating for middle and elementary schools across the US. Schools can see their ranking as well as badges for certain milestones reached. Created by <a href="https://recruit.makersquare.com/users/133">Hubert Nguyen</a>, Ronak Patel, and Philip Gheno.  

Tech
====

Server-side: Ruby on Rails, PostgreSQL with ActiveRecord, bcrypt

Client-side: d3 javaScript, jQuery, Bootstrap 

APIs: Mapbox, Leaflet

Testing: RSpec

Deployment: DigitalOcean, Heroku


![alt tag](http://s27.postimg.org/8pqpbmntv/tech_stack_3.png)

Enities 
====

Activity
School
Classroom
User
Session

![alt tag](http://s21.postimg.org/vsqioxwg7/entities.png)


User Interface
====

A user can sign up to the app with a name, email and password. They select a school they are associated with by inputting a zipcode and selecting a school from a drop down list. 

The user can enter miles on their schools interface and the odometer will record the total miles a school has thus far. 
Schools can be ranked by National, State, and City tiers. Badges can be earned as well for certain milestones. 

Purpose
====

The goal is to get students across the US to exercise and faciliate both a sense of community through the club as well as friendly compeition between schools. 

Future goals
==== 

1. Incorporate an API from MyEdReach for more accurate school validation upon signup. 
2. Addition of an Admin page to monitor overall progress of schools by miles, goals, student partipating etc. 
3. Resolve some issues with margin and padding for responsive version of the app. 
4. Inclusion of a more robust search option to select schools not only through the map, but by state, city, name etc. 


