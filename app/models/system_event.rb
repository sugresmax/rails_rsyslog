class SystemEvent < ApplicationRecord
  if Rails.env.production?
    establish_connection(
      Rails.configuration.database_configuration[Rails.env]['systemevents']
    )
  end

  self.table_name = 'systemevents'
  self.ignored_columns = %i[customerid ntseverity importance eventsource eventuser eventcategory eventid eventbinarydata
                            maxavailable currusage minusage maxusage eventlogtype genericfilename systemid infounitid]
end
