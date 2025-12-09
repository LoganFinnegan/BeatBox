require 'spec_helper'

RSpec.describe 'BeatBox' do
  before(:each) do
    @bb = BeatBox.new
  end

  it 'exists and has attributes' do
    expect(@bb.list).to be_a(LinkedList)
    expect(@bb.list.head).to eq(nil)
  end

  it 'can seed beats on initialization' do
    seeded = BeatBox.new("deep dop")

    expect(seeded.list.head.data).to eq("deep")
    expect(seeded.list.head.next_node.data).to eq("dop")
    expect(seeded.count).to eq(2)
  end

  it '#append' do 
    @bb.append("deep doo ditt")
    
    expect(@bb.list.head.data).to eq("deep")
    expect(@bb.list.head.next_node.data).to eq("doo")
    expect(@bb.list.head.next_node.data).to eq("doo")
    
    @bb.append("woo hoo shu")
    expect(@bb.count).to eq(6)
  end

  it '#append only adds approved strings' do 
    @bb.append("deep")
    @bb.append("Mississippi")

    expect(@bb.all).to eq("deep")
    
    @bb.prepend("tee tee tee Mississippi")
    expect(@bb.all).to eq("tee tee tee deep")

    @bb.add_valid_beat("Mississippi")
    @bb.append("Mississippi")
    expect(@bb.all).to eq("tee tee tee deep Mississippi")
  end

  it '#play' do 
    @bb.append("deep doo ditt woo hoo shu")

    expect(@bb.count).to eq(6)
    expect(@bb.list.count).to eq(6)

    expect(@bb).to receive(:`).with("say -r 500 -v Boing deep doo ditt woo hoo shu")
    @bb.play
  end
    
  it '#rate' do
    @bb.append("deep dop dop deep")
    
    @bb.rate = 100
    expect(@bb.rate).to eq(100)
    @bb.play

    expect(@bb.reset_rate).to eq(500)
    @bb.play
  end

  it '#voice' do
    @bb.append("deep dop dop deep")
    
    @bb.voice = "Daniel"
    expect(@bb.voice).to eq("Daniel")
    @bb.play

    expect(@bb.reset_voice).to eq("Boing")
    @bb.play
  end 
end
