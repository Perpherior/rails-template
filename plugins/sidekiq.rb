if apply_sidekiq?
  empty_directory_with_keep_file "app/workers"

  application "config.active_job.queue_adapter = :sidekiq"
  route %Q(mount Sidekiq::Web => "/sidekiq" # monitoring console\n)
  copy_file "config/sidekiq.yml"
  template "config/initializers/sidekiq.rb.tt"
end