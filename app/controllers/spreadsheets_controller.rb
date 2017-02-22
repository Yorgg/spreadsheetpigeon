class SpreadsheetsController < ApplicationController
  def show
    spreadsheet = SpreadsheetService::Get.new(
                                      id: params[:s_id], 
                                      range: params[:range])
    if spreadsheet.request_error
      render json: spreadsheet.request_error
    else
      render json: spreadsheet.data
    end
  end
end
