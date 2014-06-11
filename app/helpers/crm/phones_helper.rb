module Crm::PhonesHelper
  def phones_tag(phones)
    content = ""
    phones.each do |phone|
      content += link_to "#{phone.klass.name}：#{phone.number}", "tel:#{phone.number}", class: "label label-info label-gray"
      content += "<br />"
    end

    raw content
  end
end
