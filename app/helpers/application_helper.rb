module ApplicationHelper

  def all_count_tag(objects) 
    content_tag :span, "#{objects.count}个", class: "label label-gray font14"
  end

  def nil_label
    content_tag :span, 'Nothing', class: "label label-default"
  end
end
