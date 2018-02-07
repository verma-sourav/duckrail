class RouteValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if record.request_method.blank?

    valid = begin
      # Parse path to catch bad URIs
      URI.parse value
      # Try to see if there's already a route matching the specific method and route path
      route = Rails.application.routes.recognize_path(value, method: record.request_method)
      # If the route exists, then it should belong to the same record in order to be valid
      # or else we would allow many mocks to have the same route
      valid = route[:controller] == 'duckrails/mocks' && route[:action] == 'serve_mock'
    rescue URI::InvalidURIError => exception
      # Bad URI
      record.errors[attribute] << (options[:message] || 'is not a valid route')
    rescue ActionController::RoutingError => exception
      # FIXME: check if this exception is raised in other cases except when the route doesn't exist
      # Route doesn't exist, you may proceed
      valid = true
    end

    record.errors[attribute] << 'already in use' unless valid
  end
end
