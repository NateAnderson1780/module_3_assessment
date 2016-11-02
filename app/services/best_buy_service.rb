class BestBuyService
  def self.find_by_zip_code(zip_code)
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV['best_buy_api_key']}&format=json")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
