require 'rails_helper'

RSpec.describe 'Node' do
  before(:each) do
    @node = Node.new("plop")
  end

  it 'has attributes' do
    expect(@node.data).to eq("plop")
    expect(@node.next_node).to eq(nil)
  end
end