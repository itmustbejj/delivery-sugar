# Run rspec for libraries and chefspec for custom resources
execute 'rspec --format documentation --color' do
  cwd node['delivery']['workspace']['repo']
  environment("COVERAGE" => 'true')
end

# Execute a test-kitchen converge and destroy in EC2
delivery_test_kitchen 'quality' do
  yaml '.kitchen.ec2.yml'
  driver 'ec2'
  action [:converge, :destroy]
end
