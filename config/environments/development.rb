Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.action_mailer.delivery_method = :letter_opener
  Rails.application.config.middleware.use ExceptionNotification::Rack,
    :email => {
        :deliver_with => :deliver_now,
        :email_prefix => "Exception ",
        :sender_address => %{"notifier" <exception@challanshor.com.pk>},
        :exception_recipients => %w{touseef.murtaza@nxb.com.pk},
        :delivery_method => :letter_opener
    }
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
