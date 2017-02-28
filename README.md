# Home Accounting is the personal income/expense tracking application.

It keeps personal expenses and incomes grouped by categories. Each user can create the personal categories which are belong proper type (Expense or Income). After creating categories on the Category page, user could create any finance action belonged the created categories.
By default on the Accounting page, the finance actions are showed only the last month (about 30 days). However, there is possible to show any finance operation using the filter parameters on the top of the Accounting page.

The current user balance is showed in the header on every page. It is calculated by all finance operations.

A simple report for any period could be generated on the Report tab.

User categories are not shared for another user.

### Main used gems and DB, ruby version...

* Ruby 				version 2.2.6
* Rails 			version 5.0.1
* Devise 			version 4.2.0 	for simple registration
* Rails admin 		version 1.1.1	for management user and user data
* bootstrap-sass 	version 3.3.7	for design of application
* pg 				version 0.19.0
* PostgreSQL		version 9.6

### Installation guide

0. You should have the installed Ruby and Rails version specified above.
1. PostgreSQL should be installed too.
2. Create the 'test' role with password 'test' in your DB. Or you can change username and password on the database.yml file according to role existing in your DB.
3. The next what you need to do is the running in specified order following commands: 
 - bundle install
 - rails db:setup
 - rails db:seed
4. Now time is up to run the rails server:
 - rails s
5. If you would create an user for administrating in your application, you should manually set 'true' in "users.admin" column of any registered user.
6. Enjoy!

The application is deployed on [Heroku](https://home-accounting.herokuapp.com)