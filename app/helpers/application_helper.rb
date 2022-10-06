module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo = nil)
    if repo
      link_to repo, "https://github.com/#{author.delete(' ')}/#{repo}", target: "_blank"
    else
      link_to author, "https://github.com/#{author.delete(' ')}", target: "_blank"
    end
  end

  def flash_message(type, message)
    content_tag :p, message, class: "alert alert-#{type}"
  end
end
