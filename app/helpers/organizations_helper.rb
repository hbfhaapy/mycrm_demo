module OrganizationsHelper
  def org_parent_tag(organization)
    organization.parent.present? ? (link_to organization.parent.name, organization.parent, class: "label label-info") : (content_tag :span, "顶级", class: "label label-warning")
  end
end
