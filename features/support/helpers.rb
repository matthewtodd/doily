class CouchDBView
  def self.perform(&block)
    new.perform(&block)
  end

  def perform
    @emitted = []
    yield self
    @emitted
  end

  def emit(key, value)
    @emitted.push('key' => key, 'value' => value)
  end
end

def chef_design_document(klass)
  Chef.const_get(klass)::DESIGN_DOCUMENT
end

def chef_view_functions(klass)
  chef_design_document(klass).fetch('views')
end

def chef_view(klass, name)
  chef_view_functions(klass).fetch(name).fetch('map')
end

def evaluate_table_values(table)
  table.raw[0].each { |column| table.map_column!(column) { |value| eval(value) }}
end

def sorted_keys(hash)
  results = []
  hash.keys.sort.each { |key| results.push('key' => key)}
  results
end