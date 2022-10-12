require 'octokit'
require 'I18n'

class GistQuestionService

  # ACCESS_TOKEN = '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'
  ACCESS_TOKEN = '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'

  attr_reader :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
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
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
