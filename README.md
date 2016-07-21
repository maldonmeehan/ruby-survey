## Ruby Database with Active Record - Survey App

An app that lets people design and take surveys, July 19, 2016

By Lauren Posey & Maldon Meehan

## Description

An Epicodus student project to practice Ruby database with Active Record.

* A survey designer can create a new survey
* A survey designer can add questions to a survey
* A survey designer can update and delete surveys and questions.
* A user can add answers to the survey questions.

## Setup/Installation Requirements

Install *Stylish Salon* by cloning the repository.  
```
$ git clone https://github.com/maldonmeehan/survey-activerecord.git
```

Install required gems:
```
$ bundle install
```

Run Postgress:
```
$ postgres
```

Open a new window and run:
```
$ postgres
$ rake db:test:prepare
```

Start the Sinatra webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in your browser of choice.

## Known Bugs

No known bugs at this point

## Support and contact details

If you have any questions please feel free to contact Lauren and Maldon on github

## Technologies Used

* Ruby
* Postgres
* Sinatra

### License

MIT License

Copyright (c) 2016, **Lauren Posey & Maldon Meehan, Epicodus**
