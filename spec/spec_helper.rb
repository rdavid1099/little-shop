RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def make_trip(location)
  Trip.create(title: location.to_s,
              description: 'description', 
              price: '199.99',
              image: 'image.jpg')
end

def create_category(title)
  Category.create(title: title.to_s)
end
