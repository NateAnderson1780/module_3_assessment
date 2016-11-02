class Store
  def initialize(raw_store_params)
    @data = raw_store_params
  end

  def long_name

  end

  def city

  end

  def distance

  end

  def phone_number

  end

  def store_type

  end

  def self.by_zip_code(zip_code)
    BestBuyService.find_by_zip_code(zip_code).map do |raw_store|
      Store.new(raw_store)
    end
  end

  private
    attr_reader :data
end
