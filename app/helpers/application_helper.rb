module ApplicationHelper
  def notice_tag(content)
  	content_tag :div, content, class: "alert alert-warning" if content.present?
  end

  def strip_and_truncate(text, em = 60)
    truncate( strip_tags(text).gsub("&nbsp;", "").strip, :length => em ).html_safe
  end

  def nl2br(string)
    string.gsub(/\n/, '<br />')
  end

  def ok_tags
    %w(img p br)
  end

  def no_link
  	"javascript:void(0);"
  end

  def nil_label
    content_tag :span, "暂无", class: "label label-default"
  end

  def active(self_value, current_value, css = 'active')
    self_value == current_value ? css : ''
  end

  def upyun_token_sign
    time = Time.now.to_i + 600
    url = "/" #Attachment.last.url.file.path
    token_sign = Digest::MD5::hexdigest("netfarmer&#{time}&#{url}")
    token_sign = token_sign[12,8] + time.to_s
    token_sign = "?_upt=#{token_sign}"
  end

  def all_count_tag(objects)
    content_tag :span, "#{objects.count}个", class: "label label-gray font14"
  end

  def amount_tag(amount)
    content_tag :span, "#{number_to_currency(amount, unit: '')}元", class: "label label-warning"
  end

  # 高亮搜索结果
  def search_result_highlight(hit, field)
    field = field.to_sym
    if highlight = hit.highlight(field)
      raw highlight.format { |word| "<strong class='highlight'>#{word}</strong>" }
    else
      hit.result.send(field)
    end
  end

  # ajax分页
  def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end

  def timeline_data
    @posts.collect{|p|
      "{
      'startDate': '#{p.started_at.strftime("%Y,%m,%d")}',
      'endDate': '#{p.ended_at.strftime("%Y,%m,%d")}',
      'headline': '#{p.title}',
      'text': '#{sanitize p.content.gsub(/\r?\n/, "<br/>"), :tags => ok_tags}',
      'tag': '#{p.category.name}'
      }"
    }.join(",").html_safe
  end
end
