# Potion Planet

## Deployed site: https://potion-planet.firebaseapp.com/

(Apologies if your first form submission takes a while to process, it's probably due to Heroku loading the backend)

![Alt Text](https://media.giphy.com/media/fpuoV5B2TkCvbcSdX2/giphy.gif)

## Revelant Links

- POST => `https://potion-planet.herokuapp.com/magic`
- GET, PUT, PATCH, DELETE => `https://potion-planet.herokuapp.com/magic/<uid>`

## Run me locally!

- Clone down this repo
- Run `bundle install` to add backend dependencies
- Run `rails s` to start the rails server
- `cd` into `frontend/`
- Run `yarn install` to add frontend dependencies
- Run `yarn start` to start the web server
- Open up `http://localhost:8080/` in a browser window to start using the form

## Database Schema

The database has 3 models to start: `User`, `Transaction` and `Potion`. The `Potion` class is never really used but it made sense for me to add so that the backend could feel a bit more wholesome/realistic 😬 Here are the database relationships:

A `User` has many `Transactions`
A `Transaction` belongs to a `User` and cannot exist without one
A `User` has many `Potion`s through `Transactions`

When the api receives a `POST` request, it hits the `TransactionsController` which fires off the `CreateTransaction` service. This service creates a `Transaction` then calls one more service, `CreateUser`, which creates the user. If there's an error when trying to save the transaction to the database, an error it is surfaced to the end user.

`CreateUser` is where a user is created as long as a database entry doesn't exist with the same first and last name.

## Can it scale?

You might be asking - why did I include service objects for this tiny app? I kept scaling in mind! If Potion Planet grows to thousands of users, my little rails app might not be able to handle it so I added these services that could one day grow up to fire off async jobs that manage the load on the site.

Also, I anticipated a need for users to want to make more than one purchase at Potion Planet:tm:, so that's why a `User` *has many* `Transaction`s

## Frontend

The frontend uses React. I didn't have time to use much custom CSS so I used [Materialize](https://materializecss.com/) pretty heavily. I used babel to compile and webpack to bundle. Potion mixing can be dangerous which is why users can only buy one potion but I really wanted to give them options so I gave them a carousel 😬

There're only 2 components: `App` and `Form`

Originally, I pulled out the transaction into it's own component but I used a custom react hook that needed to pass state to each of the inputs at once so it all ended up livin in one file. If I had more time, this would be the first thing I'd refactor. Especially seeing as `fetch` is also used right in that file.

When the form is submitted, I run a validation on all of the fields to see if any of them are empty. If any of them are, I add a css class to highlight them as red. There are also validations at the server level that won't allow fields to be black when creating a `User` or a `Transaction`. See `app/models/user.rb` and `app/models/transaction.rb`.

## If I had more time

- Hash the credit card number and only store the last four digits 😬
- Connect this to a real payment processor like Stripe
- Run this by a designer to check the UX and see what improvements could be made in that realm
- Allow the user make more than one transaction
- More test coverage on the frontend
- More test coverage on the backend (there are some added for the `TransactionsController`. See `spec/controllers/transactions_controller_spec.rb`)
- Refactor `frontend/src/components/Form/index.js` to reflect a seperation of concerns (pull out the api call, make an input component that can be reusable since they're repeated a lot)
- Use rails serializers to format the json because technically according to rails conventions, they don't belong in `ApplicatonController` (`app/controllers/application_controller.rb`). Serializers don't come with rails out of the box and I started looking into adding it but it started to become a time suck so I left it as is.
- Fully integrate the `Potion` model so that end users can have options to choose from
