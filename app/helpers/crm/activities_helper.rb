module Crm::ActivitiesHelper
  
  def crm_newest_activity_tag(object)
    activity = object.activities.order("created_at desc").first

    if activity.present?
      content = content_tag :span, "#{activity.status.name}", class: "label label-info mr1"
      content += link_to activity.activityable, title: activity.name do
        strip_and_truncate(activity.name, 7)
      end
    end
  end
end
