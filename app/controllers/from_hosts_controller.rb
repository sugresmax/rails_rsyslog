class FromHostsController < AuthenticatedController
  def index
    @from_hosts = FilteredSystemEventsQuery.new(SystemEvent.all, { fromhost_ilike: params[:q] })
                                           .call.distinct.limit(10).pluck(:fromhost).sort
  end
end
