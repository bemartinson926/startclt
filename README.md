##StartCharlotte README

##QUICK START Instructions

#####Clone Repo into local directory
via ssh (preferred):  
`git@github.com:bemartinson926/CP_StartCharlotte.git`  
via https:  
`https://github.com/bemartinson926/CP_StartCharlotte.git`
#####cd into app
`cd StartCharlotte`  
#####Create new db file by copying contents of database.yml.example into new file in config folder
`cp config/database.yml.example config/database.yml`
#####Run bundler
`bundle install` 

###Start Postgres  
`pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`

###Setup the DB
`bundle exec rake db:create`  
`bundle exec rake db:migrate`

###Start the Server
`bundle exec rails s`