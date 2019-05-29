require './lib/blog_app/repos/events_repo'

class LogEventsRepo < BlogApp::Repos::EventsRepo
  def log(type, object)
    object_data = object.respond_to?(:to_h) ? object.to_h : object.to_s
    event_hash = {
      type: type,
      object: object_data
    }
    Rails.logger.info("EVENT: #{Oj.dump(event_hash, mode: :compat)}")
  end
end
