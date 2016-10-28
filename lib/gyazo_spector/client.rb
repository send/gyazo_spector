# frozen_string_literal: true

module GyazoSpector
  # concreate implemtation of Client
  class Client
    CONTENT_TYPE = 'image/png'.freeze
    DEFAULT_SITE = 'http://gyazo.com'.freeze
    DEFAULT_ENDPOINT = '/'.freeze
    DEFAULT_POLTERGEIST_OPTIONS = {
      js_errors: false,
      timeout: 1000,
      debug: false
    }.freeze
    DEFAULT_SELECTOR = :css

    attr_reader :site, :endpoint, :session, :imagedata

    def initialize(opts = {})
      @site = opts.delete(:site) || DEFAULT_SITE
      @endpoint = opts.delete(:endpoint) || DEFAULT_ENDPOINT
      Capybara.default_selector = opts.delete(:selector) || DEFAULT_SELECTOR

      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(
          app, DEFAULT_POLTERGEIST_OPTIONS.merge(opts)
        )
      end
    end

    def session
      @session ||= Capybara::Session.new(:poltergeist)
    end

    def capture(url, options = {})
      session.visit(url)
      yield(session) if block_given?
      @imagedata = Base64.decode64(session.driver.render_base64(:png, options))
      self
    end

    def upload!
      Faraday.new(site) do |client|
        client.request :multipart
        client.request :url_encoded
        client.adapter Faraday.default_adapter
      end.post(
        endpoint,
        imagedata: Faraday::UploadIO.new(StringIO.new(imagedata), CONTENT_TYPE)
      ).body
    end
  end
end
