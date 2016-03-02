require './config/environment'
require 'shotgun'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run ApplicationController
use StudentController
use ClassController
use TeacherController
use AssignmentController
use CurriculumController
