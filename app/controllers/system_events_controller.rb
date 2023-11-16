class SystemEventsController < AuthenticatedController
  def index
    @system_events = FilteredSystemEventsQuery.new(SystemEvent.all, filter_params)
                                              .call.order(receivedat: :desc).page(params[:page]).per(params[:per])
    @system_events_present = present @system_events
  end

  private

  def filter_params
    { fromhost: params[:fromhost], syslogtag: params[:syslogtag], message: params[:message],
      from_time: params[:from_time], till_time: params[:till_time], facility: params[:facility] }
  end
end
