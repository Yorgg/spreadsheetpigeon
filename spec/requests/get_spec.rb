require_relative '../rails_helper.rb'

describe "Get Request", type: :request do
  let(:path) do
    '/spreadsheet?s_id=1NFAPv8CNUaOure-d33-rFanoe9Wcfn1KkdGnf-5fJhA&range=sheet1'
  end 

  before do
    #Webmock, successful get 
    stub_request(:get, /#{SpreadsheetService::API_URL}/)
      .to_return(status: 200, body: 'webmock-data', headers: {})
  end
  
  context "not a cors request" do
    it "does not call spreadsheets api" do
      get path
      expect(response.body).to eq('') 
    end
  end

  context "is a cors request" do
    it "calls spreadsheets api" do
      get path, headers: { origin: 'anotherwebsite.com' }
      expect(response.body).to eq('webmock-data') 
    end
  end
end
