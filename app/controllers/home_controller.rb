class HomeController < ApplicationController

  def home_page
    search_ip = params[:search_query] || request.ip
    @ip_details = ApiClient.new(end_point: ENV_PROPS['ip_details.url']).get_ip_details(ip: search_ip)
  end

end