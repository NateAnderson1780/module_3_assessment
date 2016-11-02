class SearchController < ApplicationController
  def index
    @stores = Store.by_zip_code(params[:zip_code])
  end

  def show
    @store = Store.find(params[:store_id])
  end
end
