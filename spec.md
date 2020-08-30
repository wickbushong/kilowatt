# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database -- users, device, option data is persisted in a database using activerecord
- [x] Include more than one model class (e.g. User, Post, Category) -- users, devices, options
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) -- User has_many Devices and Groups
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -- Group belongs_to User
- [x] Include user accounts with unique login attribute (username or email) -- username and password required for login
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying -- Devices and Groups can be created, read, update, and read through the device controller routes
- [x] Ensure that users can't modify content created by other users -- Device CRUD actions check to ensure user is logged in and that the device belongs to the user
- [x] Include user input validations -- user controller validates username upon signup and authenticates password upon login
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) -- post '/signup' uses validation error messages
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message