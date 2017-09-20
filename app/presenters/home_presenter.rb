class HomePresenter
  include Btspm::Presenters::Presentable

  class Scalar < Btspm::Presenters::ScalarPresenter

    def region_country_format(name:, code:)
      return '-' unless name
      "#{name} (#{code})"
    end

    def country_code(code:)
      code.try(:downcase)
    end

    def org_search_url(org:)
      return '-' unless org
      search_query = org.gsub(' ', '+')
      'https://www.google.com/search?q=' + search_query
    end

    def proxy_format(result:)
      result.try(:capitalize) || '-'
    end

    def display_format(value:)
      value || '-'
    end

  end
end