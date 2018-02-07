module Duckrails
  module MocksHelper
    def available_mime_types
      Mime::EXTENSION_LOOKUP.map{ |a| a[1].to_s }.uniq.sort
    end

    def available_script_types
      [ [t(Duckrails::Mock::SCRIPT_TYPE_EMBEDDED_RUBY), Duckrails::Mock::SCRIPT_TYPE_EMBEDDED_RUBY],
        [t(Duckrails::Mock::SCRIPT_TYPE_JS), Duckrails::Mock::SCRIPT_TYPE_JS],
        [t(Duckrails::Mock::SCRIPT_TYPE_STATIC), Duckrails::Mock::SCRIPT_TYPE_STATIC] ]
    end
  end
end
