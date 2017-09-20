class HomeController < ApplicationController

  def home_page
    params[:search_query] ||= request.ip
    details = api_details(ip: params[:search_query], type: CommonConstants::IP_DETAILS, end_point: ENV_PROPS['ip_details.url'])
    @ip_details = present(details, HomePresenter)
  end

  def proxy_details
    details = api_details(ip: params[:search_query], type: CommonConstants::PROXY_DETAILS, end_point: ENV_PROPS['proxy_details.url'])
    @proxy_details = present(details, HomePresenter)
  end

  private

  def api_details(ip:, type:, end_point:)
    ApiClient.new(end_point: end_point).get_details(ip: ip, type: type)
  end

end