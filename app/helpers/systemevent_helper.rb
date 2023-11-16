module SystemeventHelper
  def system_event_tags(event)
    return if event.syslogtag.blank?

    tag.div do
      event.syslogtag.split(',').each do |event_tag|
        concat content_tag :span, event_tag, class: 'badge text-bg-secondary'
      end
    end
  end

  def system_event_classes(event)
    severity_levels = %w[emergency alert critical error warning notice debug]

    return [] if event.syslogtag.blank?

    current_classes = event.syslogtag.split(',')
    classes = []

    current_classes.each do |c|
      classes.push "table-#{c}" if severity_levels.include?(c)
    end

    classes
  end

  def facilities
    (0..16).to_a.map { |k| [I18n.t("facility.#{k}"), k] }
  end
end
