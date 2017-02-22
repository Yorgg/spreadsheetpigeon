require_relative '../rails_helper.rb'
 
describe SpreadsheetService do 
  before(:each) do
    stub_request(:get, /#{SpreadsheetService::API_URL}/).
      to_return(status: 200, body: "data", headers: {})
  end

  context 'When get request sent' do 
    it 'returns a request error 404' do
      response = SpreadsheetService::Get.new(id: 13, range: 'sheet1')
      expect(response.data).to include('data')   
    end
  end

  context 'When API_KEY is missing' do 
    it 'raises a ConfigError' do
      SpreadsheetService::API_KEY = nil
      request = ->() {SpreadsheetService::Get.new(id: 13, range: 'sheet1')}
      expect(request).to raise_error(SpreadsheetService::ConfigError)   
    end
  end
end
