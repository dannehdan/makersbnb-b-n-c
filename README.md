# MakersBnB

https://makersbnb-b-n-c.herokuapp.com/

Team name: Boats n Codes 

This project is to create a full stack web application that is an AirBnb Clone. MakersBnb will allow users to sign up in order to list, view and rent properties. 


```
ruby 3.0.0
bundle install
rackup
```

# Git Commands 
```
git checkout -b <branch name>
```

## User Stories

```
As a person,
So that I can use the MakersBnB service,
I want to sign up as a new user
```
```
As a property owner, 
So that I can get a tenant,
I want to list a new space
```
```
As a property owner,
So that I can make my room apealling,
I want to be able to provide a description and price for my room
```
```
As a property owner,
So that I can get multiple tenants, 
I want to be able to list multiple rooms
```
```
As a property owner,
So I can show tenants when they can book,
I want to be able to list available dates for my rooms
```
```
=> This user story may not be needed in future
As a user,
So that I can rent a room,
I want to sign up as a new user
```
```
As a user,
So that I can see what properties are available,
I want to be able to see a list of properties
```
```
As a user,
So that I can reserve a room,
I want to be able to book a room
```
```
As a user,
So that I can plan my trip,
I want confirmation that I have successfully booked a room
```
```
As a tenant,
So that I can book a room,
I want to know if a room is unavailable
```
```
As a property owner,
So that my room availability is accurate,
My space(s) will remain available until a user has confirmed a booking request
```

# How To Run 

Clone this repository and then run:
bundle

=> Make sure to add info about env vars 

### To set up the database

Connect to `psql` and create the `makersbnb` and `makersbnb_test` databases:

```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the MakersBnB app:

```
rackup -p 3000
```
To view rooms, navigate to `localhost:3000/rooms`.

### To run tests:

```
rspec
```
### To run linting:
```
rubocop
```
