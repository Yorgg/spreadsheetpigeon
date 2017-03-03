class SpreadsheetsController < ApplicationController
  def show
    render json: request.origin ? spreadsheet : ''
  end

  private
  
  def spreadsheet
    SpreadsheetService.new.get(
      id:    params[:s_id], 
      range: params[:range]
    ) 
  end
end
