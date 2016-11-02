class Store
  def initialize(raw_store_params)
    @data = raw_store_params
    byebug
  end

  def name
    data[:longName]
  end

  def city
    data[:city]
  end

  def distance
    data[:distance]
  end

  def phone_number
    data[:phone]
  end

  def store_type
    data[:storeType]
  end

  def self.by_zip_code(zip_code)
    BestBuyService.find_by_zip_code(zip_code).map do |raw_store|
      Store.new(raw_store)
    end
  end

  private
    attr_reader :data
end
