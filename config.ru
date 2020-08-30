require './config/environment'

if Option.all.empty?
  Scraper.call
end

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use Rack::MethodOverride

use GroupsController
use DevicesController
use UsersController

run ApplicationController
