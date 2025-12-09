require 'spec_helper'

RSpec.describe 'LinkedList' do
  before(:each) do
    @list = LinkedList.new
  end

  it 'has attributes' do
    expect(@list.head).to eq(nil)
  end

  it '#append sets head for first node' do
    expect(@list.append('doop')).to eq('doop')

    expect(@list.head.data).to eq('doop')
    expect(@list.head.next_node).to eq(nil)
    expect(@list.count).to eq(1)
  end

  it '#append links subsequent nodes' do
    @list.append('doop')
    @list.append('deep')

    expect(@list.head.data).to eq('doop')
    expect(@list.head.next_node.data).to eq('deep')
    expect(@list.head.next_node.next_node).to eq(nil)
    expect(@list.count).to eq(2)
  end

  it '#to_string' do
    @list.append('doop')
    expect(@list.to_string).to eq('doop')

    @list.append('deep')
    expect(@list.to_string).to eq('doop deep')
  end

  it '#prepend' do
    @list.append("plop")
    expect(@list.to_string).to eq("plop")
    
    @list.append("suu")
    expect(@list.to_string).to eq("plop suu")
    
    @list.prepend("dop")
    expect(@list.to_string).to eq("dop plop suu")

    expect(@list.count).to eq(3)
  end

  it '#insert' do 
    @list.append("plop")
    expect(@list.to_string).to eq("plop")
    
    @list.append("suu")
    expect(@list.to_string).to eq("plop suu")
    
    @list.prepend("dop")
    expect(@list.to_string).to eq("dop plop suu")

    expect(@list.insert(1, "woo")).to eq("woo")
    expect(@list.to_string).to eq("dop woo plop suu")
  end

  it '#find' do 
    @list.append("deep")
    @list.append("woo")
    @list.append("shi")
    @list.append("shu")
    @list.append("blop")

    expect(@list.find(2,1)).to eq("shi")
  end

  it '#pop' do 
    @list.append("deep")
    @list.append("woo")
    @list.append("shi")
    @list.append("shu")
    @list.append("blop")

    expect(@list.pop).to eq("blop")
    expect(@list.pop).to eq("shu")
    expect(@list.to_string).to eq("deep woo shi")
  end

  it '#pop handles edge cases' do
    expect(@list.pop).to eq(nil)

    @list.append("only")
    expect(@list.pop).to eq("only")
    expect(@list.head).to eq(nil)
  end

  it '#includes?' do
    @list.append("deep")
    @list.append("woo")
    @list.append("shi")

    expect(@list.includes?("deep")).to be true
    expect(@list.includes?("woo")).to be true
    expect(@list.includes?("dep")).to be false
    expect(@list.includes?("shu")).to be false
  end
end
