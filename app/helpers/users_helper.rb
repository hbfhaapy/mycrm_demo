module UsersHelper
  def user_org_tag(user)
    user.organization.present? ? (link_to "##{user.organization.id} #{user.organization.name}", user.organization, class: "label label-info") : nil_label
  end

  def user_roles_tag(user)
    user.roles.present? ? user.roles.map { |role| role.name }.join(',') : nil_label
  end
end
