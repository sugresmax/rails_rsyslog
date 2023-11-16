class SystemEventPresenter < ApplicationPresenter
  def received_at
    return unless subject.receivedat

    I18n.l subject.receivedat, format: :long
  end

  def device_reported_time
    return unless subject.devicereportedtime

    I18n.l subject.devicereportedtime, format: :long
  end

  def facility
    return unless subject.facility

    I18n.t "facility.#{subject.facility}"
  end
end
