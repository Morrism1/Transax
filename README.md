# Transax

> Transax is a transaction-tracking mobile web application for recording money spent shoping or other transaction needs you have.
> 

![Screenshot 2020-12-07 002919](https://user-images.githubusercontent.com/46853433/101294994-7bfb2700-3823-11eb-8f45-af6d78c0752c.png)

## Entity Relation Diagram (ERD)

![Screenshot 2020-12-09 042518](https://user-images.githubusercontent.com/46853433/101566121-20719a80-39d7-11eb-8206-73ebff78c663.png)

## Built With

* Ruby v2.7.1
* Ruby on Rails v6.0.3
* Tailwind 2.0
* Rspec
* Capybara
* Rubocop
* Stylelint
* Windows WSL(Ubuntu 20.04)
* Github-Actions
* VsCode

## Live Demo

[Live Demo](https://calm-atoll-97228.herokuapp.com/)

## Getting Started

While the Live Demo provides a demonstration of how the application functions, If you want to add new features and use the code for learning, it is better to have a local environment.

### Prerequisites

The prerequisites for local installation include [Ruby on Rails](http://railsinstaller.org/en), [Ruby](https://www.ruby-lang.org/en/downloads/), PostgreSQL.

PostgreSQL, which handles Transax's database, is listed with all the other prerequisite gems in the Gemfile. These may be installed en masse using [Bundler](https://bundler.io/).

### Setup

1. Open a Terminal and navigate to the location in your system where you would like to download the project. **New to Terminal? [Learn here](https://www.freecodecamp.org/news/conquering-the-command-line-f85f5e46c07c/).**

2. Enter the following line of code to clone this repository:
`git clone git@github.com:Morrism1/Transax.git`

3. Enter the following line of code to move inside the downloaded repo:
`cd Transax`

4. To install all of the project's gems, run the following:
`bundle install`

5. To install Javascript dependencies, you need to run the following:
`yarn install --check-files`

6. To set up the project's databases, run the following:
`rails db:setup ; rails db:create ; rails db:migrate`

**Congratulations!** Transax is now ready to roll!

### Usage

Accessing the application requires a running server. This can easily be achieved from the project's root directory by running `rails s`. The app will now be accessible at the following URL: `http://localhost:3000/`.

### Run tests

Transax's tests are managed by the rspec-rails gem. Running tests is as easy as entering `rspec` or
`bundle exec rspec` in the project's root directory. For more information on rspec-rails, take a look at their [GitHub repo](https://github.com/rspec/rspec-rails).

### Deployment

These are ways, you can follow to deploy your app to [Heroku](https://www.heroku.com/)

1. Create an account and set up heroku local on your machine using [HerokuCLI](https://devcenter.heroku.com/articles/heroku-cli)

2. Start by creating your app, by running in your app terminal:
`Heroku create`
this will set your remote branch for deployment.

3. Almost done, to deploy to that remote branch run:
`git push heroku master`

4. To be able to use our app, we need to finally run this command:
`heroku run rails db:migrate`
we need to manually migrate the database.

## Author

👤 **Maurice MURANGWA**

* Github: [@Morrism1](https://github.com/Morrism1)

* Twitter: [@MorrisMontana0](https://twitter.com/MurangwaMorris)

* Linkedin: [Maurice Murangwa](https://www.linkedin.com/in/mauricemurangwa/)  

## 🤝 Contributing

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

* [Microverse](https://www.microverse.org/)
* [Design](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=)
* [Heroku](https://www.heroku.com/)
* [The Best readme Template](https://github.com/othneildrew/Best-README-Template)

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
