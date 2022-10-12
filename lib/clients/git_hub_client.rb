class GitHubClient

  ROOT_ENDPOIN = "https://api.github.com"
  ACCESS_TOKEN = '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'
  
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('/gists') do |request|
      request.headers["Authorization"] = "token #{ACCESS_TOKEN}"
      request.headers["Accept"] = "application/vnd.github+json"
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOIN)
  end

end