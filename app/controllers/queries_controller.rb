class QueriesController < ApplicationController

  respond_to :json

  def create
    respond_with @query = Query.find_or_create_by(input: params[:query])
  end
end
