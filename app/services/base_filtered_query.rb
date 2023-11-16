class BaseFilteredQuery
  attr_reader :relation, :filter_params

  def initialize(relation, filter_params = {})
    @relation = relation
    @filter_params = filter_params.with_indifferent_access
  end

  def call
    filter_params.reduce(relation) do |relation, (key, value)|
      public_send("by_#{key}", relation, value)
    end
  end
end
