class FilteredSystemEventsQuery < BaseFilteredQuery
  def by_fromhost(relation, fromhost_value)
    return relation if fromhost_value.blank?

    relation.where(fromhost: fromhost_value)
  end

  def by_fromhost_ilike(relation, fromhost_value)
    return relation if fromhost_value.blank?

    relation.where('fromhost ILIKE ?', "%#{fromhost_value}%")
  end

  def by_syslogtag(relation, syslogtag_value)
    return relation if syslogtag_value.blank?

    relation.where('syslogtag ILIKE ?', "%#{syslogtag_value}%")
  end

  def by_facility(relation, facility_value)
    return relation if facility_value.blank?

    relation.where(facility: facility_value)
  end

  def by_message(relation, message_value)
    return relation if message_value.blank?

    relation.where('message ILIKE ?', "%#{message_value}%")
  end

  def by_from_time(relation, from_time_value)
    return relation if from_time_value.blank?

    relation.where('receivedat >= ?', from_time_value)
  end

  def by_till_time(relation, till_time_value)
    return relation if till_time_value.blank?

    relation.where('receivedat <= ?', till_time_value)
  end
end
