# Bloccit
[View project](https://vast-thicket-98832.herokuapp.com/)

**Bloccit** is a Rails application that allows users to create, rate, and comment on posts. Posts are organized by topics, which are created by admin accounts. Users that are signed have their posts and comments linked to their profile. RSpec with Test-driven-development was used to develop Bloccit.

Bloccit was deployed using [Heroku](https://signup.heroku.com/)

![alt text](https://github.com/ameliagalgon/ameliagalgon.github.io/blob/master/assets/images/bloccit-1.png "Bloccit screenshot")


### Installation
Using **Rails version 5.1.4** and **SQLite3**
Clone the program into your local environment
```
git clone https://github.com/ameliagalgon/bloccit.git
```
Run `bundle install` to install all of the gems
```
bundle install --without production
```
Create a migrate a SQList database
```
rake db:create
rake db:migrate
```
Start the rails server
```
rails server
```
Go to [localhost:3000](http://localhost:3000) to view the application

### Gems used to create Bloccit
| Gem | Use  |
| --- | --- |
| Bootstrap | Style the application |
| BCrypt | Authenticate users and their passwords |
| Figaro | Configure the [Sendgrid](https://sendgrid.com/) addon to the Heroku build |
| FactoryGirl | Create factories for models |

#### Notes
Made with my mentor at [Bloc](http://bloc.io).
