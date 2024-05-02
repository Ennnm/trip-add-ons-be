# README
## Models
This project tries to simulate a simplified case of adding add-ons to a trip

Ignoring the creation of:
- users
- user_trips
- user_trip_add_ons
- trips (as a table of unique trips to be reused in user_trips)

These are reduced to the trips and add_ons table where it is assumed that
- all add_ons can be applied for all trips

## Setup
### run seeders
`rails db:seed`

### run server
`rails server`