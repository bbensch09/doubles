#processes for sidekiq deployment to heroku
web: bundle exec thin start -p $PORT
worker: bundle exec sidekiq -c 25 -i 666
