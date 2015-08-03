# Build attributes for a model that include associations
def build_attributes(*args)
  FactoryGirl.build(*args).attributes.delete_if do |k, _v|
    %w(id created_at updated_at).member?(k)
  end
end
