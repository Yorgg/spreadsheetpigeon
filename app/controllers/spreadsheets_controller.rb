class SpreadsheetsController < ApplicationController
  def show
    spreadsheet = SpreadsheetRequest.new(id: params[:s_id], 
                                      range: params[:range])
    render json: spreadsheet.data
  end
end
