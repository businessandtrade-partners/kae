web: bundle exec rake cf:run_migrations db:migrate && bundle exec puma -C config/puma.rb
app: cp -r /workspace/db-copy/* /workspace/db/ && cp -r /workspace/public-copy/* /workspace/public/ && bundle exec rake cf:run_migrations db:migrate && bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -C ./config/sidekiq.yml
