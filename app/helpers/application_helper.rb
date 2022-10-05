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

  def flash_messages
    if flash[:notice]
      content_tag :p, notice, class: "alert alert-success"
    elsif flash[:alert]
      content_tag :p, alert, class: "alert alert-danger"
    end
  end

      
end
