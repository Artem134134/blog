##  Blog - the application for writing posts and editing them with user authentication.
---
### Technologies:
* Ruby 
* Rails 
* Node JS
---
### Tests:
* Rspec-rails
* Capybara
* Debug
* Factory bot rails
---
### Employment:
1. To get started, you need to clone the repository with the command
 `git clone https://github.com/Artem134134/blog.git `
2. PLATFORMS - x86_64-linux(any distribution of your choice) 
3. Still need to install these packages `sudo apt-get install zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn -y`
4. Install gems: `bundle install`
5. `rails db:migrate`


---
### Starting Development Server:
1. Open the console in the project directory and enter the command: `rails server` or `rails s`
2. Open a browser and type in the search bar `localhost:3000`
3. Use `Ctrl-C` to stop
---
### Testing. 
_Our project is partially covered by unit tests._

 * gem 'debug',  [=> tutorial here](https://edgeguides.rubyonrails.org/debugging_rails_applications.html)
 * gem 'rspec-rails'  [=> tutorial here](https://github.com/rspec/rspec-rails)
 * gem 'shoulda-matchers'  [=> tutorial here](https://github.com/thoughtbot/shoulda-matchers)
 * gem 'capybara'  [=> tutorial here](https://github.com/teamcapybara/capybara)
 * gem 'factory_bot_rails'  [=> tutorial here](https://github.com/thoughtbot/factory_bot_rails)
