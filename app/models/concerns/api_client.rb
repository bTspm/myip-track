class ApiClient
  attr_accessor :end_point, :conn

  def initialize(end_point:)
    @end_point = end_point
    @conn = Faraday.new
  end

  def get_details(ip:, type:)
    url = end_point+"#{ip}"
    url = url+'&vpn=1' if type == CommonConstants::PROXY_DETAILS
    _get(url: url)
  end

  private

  def _get(url:)
    Rails.logger.info "Get Details for: #{url}"
    response = Rails.cache.fetch("#{url}", expires_in: 24.hours) do
      conn.get url
    end
    parse_response(response: response)
  end

  def parse_response(response:)
    JSON.parse(response.body).with_indifferent_access
  end

end