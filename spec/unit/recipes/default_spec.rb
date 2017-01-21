require 'chefspec'

describe 'apache::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'check httpd installation' do
    expect(chef_run).to install_package('httpd')
  end

  it 'check service' do
    expect(chef_run).to enable_service('httpd')
  end

  it 'file creation' do
    expect(chef_run).to create_template('/var/www/index.html')
  end
end
