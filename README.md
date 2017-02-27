# Home Accounting is the personal income/expense tracking application.

It keeps personal expenses and incomes grouped by categories. Each user can create the personal categories which are belong proper type (Expense or Income). After creating categories on the Category page, user could create any finance action belonged the created categories.
By default on the Accounting page, the finance actions are showed only the last month (about 30 days). However, there is possible to show any finance operation using the filter parameters on the top of the Accounting page.

The current user balance is showed in the header on every page. It is calculated by all finance operations.

A simple report for any period could be generated on the Report tab.

User categories are not shared for another user.

### Main used gems and DB, ruby version...

* Ruby 				version 2.2.6
* Rails 			version 5.0.1
* Devise 			version 4.2.0 	for simple registriation
* Rails admin 		version 1.1.1	for managment user and user data
* bootstrap-sass 	version 3.3.7	for design of applicatoin
* pg 				version 0.19.0
* PostgreSQL		version 9.6

The application is deployed on [Heroku](https://home-accounting.herokuapp.com)