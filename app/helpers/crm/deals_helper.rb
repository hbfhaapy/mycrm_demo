module Crm::DealsHelper

  def newest_deal_tag(contact)
    deal = contact.deals.order("created_at desc").first

    if deal.present?
      content = content_tag :span, "#{deal.amount}元", class: "label label-warning mr1"
      content += link_to deal, title: deal.name do
        strip_and_truncate(deal.name, 7)
      end
    end
  end
end
