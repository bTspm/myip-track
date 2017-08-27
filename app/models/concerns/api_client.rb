class ApiClient
  attr_accessor :end_point, :conn

  def initialize(end_point:)
    @end_point = end_point
    @conn = Faraday.new
  end

  def get_ip_details(ip:)
    url = end_point+"#{ip}"
    _get(url: url)
  end

  private


  def _get(url:)
    Rails.logger.info "Get Details for: #{url}"
    response = conn.get url
    JSON.parse(response.body).with_indifferent_access
  end

end

