Rails.application.routes.draw do
  get '/spreadsheet', to: 'spreadsheets#show'
end
