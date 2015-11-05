require_relative 'spec_helper'

describe Post do

  before :each do
    @post = Post.new
  end

  it "has and knows its title" do
    expect(@post.title).to_return(true)
  end

  
end