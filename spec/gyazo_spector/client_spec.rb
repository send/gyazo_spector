require 'spec_helper'

describe GyazoSpector::Client do
  let(:site) { 'http://example.com' }
  let(:endpoint) { '/path/to/upload.cgi' }
  subject(:client) { GyazoSpector::Client.new(site: site, endpoint: endpoint) }
  let(:html) { File.read('./spec/fixtures/dummy.html') }
  let(:url) { 'http://example.net/path/to/captured' }
  let(:dummy_response) { 'http://example.com/image/dummy.png' }

  context 'basic usage' do
    before do
      stub_request(:get, url).to_return(body: html)
      stub_request(:post, 'http://example.com/path/to/upload.cgi')
        .to_return(body: dummy_response)
    end
    it 'posts a capturing image and return image url' do
      expect(client.capture(url, selector: '#main').upload!).to eq dummy_response
    end
  end
end
