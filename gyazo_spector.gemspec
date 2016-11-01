# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gyazo_spector/version'

Gem::Specification.new do |spec|
  spec.name = 'gyazo_spector'
  spec.version = GyazoSpector::VERSION
  spec.authors = ['SAKAI, Kazuaki']
  spec.email = ['kaz.july.7@gmail.com']

  spec.summary =
    'GyazoSpector is a Gyazo client for uploading a screenshots of a web page.'
  spec.description =
    'GyazoSpector capture full or part of a web page, upload to another server.'
  spec.homepage = 'https://github.com/send/gyazo_spector'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'capybara', '~> 2.10'
  spec.add_dependency 'faraday', '< 0.10', '>= 0.7.4'
  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_dependency 'poltergeist', '~> 1.11'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.44'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'travis', '~> 1.8'
  spec.add_development_dependency 'webmock', '~> 2.1'
end
