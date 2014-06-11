module Crm::AddressesHelper
  def addresses_tag(addresses)
    content = ""
    addresses.each do |address|
      content += link_to address.content,  "http://api.map.baidu.com/geocoder?address=#{address.content}&output=html", target: "_blank", class: "label label-warning label-gray label-address"
      content += "<br />"
    end

    raw content
  end
end
