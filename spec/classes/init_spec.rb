require 'spec_helper'
describe 'netboot' do
  context 'with default values for all parameters' do
    it { should contain_class('netboot') }
  end
end
