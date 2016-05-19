module Editorium
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration if block_given?
  end

  class Configuration
    attr_accessor :service_url, :preview_layout

    def initialize
      @service_url = if ::Rails.env.production?
                       'http://tc-editorium-prod.s3-website-us-east-1.amazonaws.com/'
                     else
                       'http://tc-editorium-stage.s3-website-us-east-1.amazonaws.com/'
                     end
      @preview_layout = false
    end
  end
end
