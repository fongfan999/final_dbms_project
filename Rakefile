# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

Rake::Task['assets:precompile'].enhance [:js_deps_install]

task :js_deps_install do
  sh 'yarn install'
end