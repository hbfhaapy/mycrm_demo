module OrganizationsHelper
  def org_parent_tag(organization)
  	organization.parent.present? ? (link_to organization.parent.name, organization.parent, class: "label label-info") : (content_tag :span, "顶级", class: "label label-warning")
  end

  def render_tree(groups)
	content_tag(:ul) do
	  groups.map do |group|
	    content_tag(:li) do
	      (link_to group.name, group) +
	      #content_tag(:div, group.users.map { |u| link_to u.username, u }.join(",").html_safe, class: "font12") +
	      render_tree(group.children)
	    end
	  end.join.html_safe
	end
  end
end
