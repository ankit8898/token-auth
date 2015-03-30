desc "Build client app"
task :client_build do
  system "cd server && rm -rf public && cd .."
  system "cd client && grunt build"
end


desc "Deploy on heroku"
task :deploy_heroku do
  system "git subtree push --prefix server heroku master"
end
