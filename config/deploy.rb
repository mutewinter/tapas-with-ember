require 'mina/git'

set :domain, 'sweet-domain.io'
set :deploy_to, '/srv/project_name'
set :repository, 'git@github.com:you/project_name'
set :branch, 'master'
set :user, 'deploy'
set :forward_agent, true

set :shared_paths, ['node_modules']

task :environment do
  queue %{
    echo "-----> Loading environment"
    #{echo_cmd %[source ~/.profile]}
  }
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/node_modules"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/node_modules"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    queue "#{echo_cmd %[npm install]}"
    queue 'cake build'
    queue 'echo "-----> Deleting source files"'
    queue 'ls -1 | grep -v "public\\|node_modules" | xargs rm -rf'
    queue 'echo "-----> Deleting node_modules symlink"'
    queue 'rm node_modules'
  end
end
