require_relative '../rails_helper.rb'

SERVICE = SpreadsheetService 

describe SERVICE do 
  let(:spreadsheet_id) { 13 }
  let(:range) { 'sheet1' }

  subject(:response) do
    SERVICE.new.get(id: spreadsheet_id, range: range) 
  end 

  before do
    #Webmock, successful get 
    stub_request(:get, /#{SERVICE::API_URL}/)
      .to_return(status: 200, body: 'webmock-data', headers: {})
  end

  context 'Bad Get request' do 
    before do
      #Webmock, unsuccessful get
      stub_request(:get, /#{SERVICE::API_URL}/)
        .to_raise(StandardError)
    end
    it 'returns the error message' do 
      expect(response).to include('StandardError')  
    end 
  end

  context 'Successful Get request' do 
    it 'returns the response data' do
      expect(response).to include('webmock-data')   
    end
  end

  context 'API_KEY missing' do 
    it 'raises a ConfigError' do
      SERVICE::API_KEY = nil
      expect { response }.to raise_error(
        SERVICE::ConfigError
      )   
    end
  end
end
