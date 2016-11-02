class SearchController < ApplicationController
  def index
    @stores = Store.by_zip_code(params[:zip_code])
    byebug
  end
end
