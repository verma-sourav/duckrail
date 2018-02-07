module ApplicationHelper
  def title(page_title)
    content_for :title, "DuckRails - #{page_title}"
  end
end
