module ApplicationHelper

  # Return the full title on a pre-gage basis.
  def full_titile(page_title)
    base_titile = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_titile
    else
      "#{base_titile} | #{page_title}"
    end
  end

end
