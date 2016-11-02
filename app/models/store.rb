class Store
  def initialize(raw_store_params)
    @data = raw_store_params
  end

  def self.by_zip_code(zip_code)
    BestBuyService.find_by_zip_code(zip_code).map do |raw_store|
      Store.new(raw_store)
    end
  end
end
