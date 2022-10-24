class GistQuestionService
  attr_reader :client

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  GitHubGist = Struct.new(:args) do

    def success?
      args[:gist] ? true : false
    end

    def gist_url
      args[:gist][:html_url] if success?
    end

    def error_message
      args[:error]
    end
  end

  def call
    GitHubGist.new(gist: @client.create_gist(gist_params))
  rescue Octokit::Unauthorized
    GitHubGist.new(error: I18n.translate("gist_question_service.auth_error"))
  end

  private

  def gist_params
    {
      "description": I18n.translate("gist_question_service.description", test: @test.title),
      "public": true,
      "files": {
        "test-app-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
