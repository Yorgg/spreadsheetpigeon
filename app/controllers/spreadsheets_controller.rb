class SpreadsheetsController < ApplicationController
  def show
    spreadsheet = SpreadsheetService.new.get(
		    id: params[:s_id], 
		    range: params[:range])

    render json: request.origin ? spreadsheet : ''
  end
end
