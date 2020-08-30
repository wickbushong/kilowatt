require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

if Option.all.empty?
  Scraper.call
end

use Rack::MethodOverride

use GroupsController
use DevicesController
use UsersController

run ApplicationController
