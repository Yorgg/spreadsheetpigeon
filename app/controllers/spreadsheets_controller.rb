class SpreadsheetsController < ApplicationController
  def show
    spreadsheet = SpreadsheetService::Get.new(
		    id: params[:s_id], 
		    range: params[:range])
    
    if request.origin 
      render json: spreadsheet.request_error || spreadsheet.data
    else
      render json: ''
    end
  end
end
