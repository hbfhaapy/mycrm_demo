module UsersHelper
  def user_org_tag(user)
  	user.organization.present? ? (link_to "##{user.organization.id} #{user.organization.name}", user.organization, class: "label label-info") : nil_label
  end

  def user_roles_tag(user)
  	user.roles.present? ? user.roles.map { |r| r.name }.join(",") : nil_label
  end

  def user_checking_level_tag(user)
  	(user.level.present? && user.level > 1) ? user.level : ""
  end
end
