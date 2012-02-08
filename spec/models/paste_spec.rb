require 'spec_helper'

describe Paste do
  context 'invalid' do
    before(:each) do
      @paste = Paste.new
    end

    it 'should be invalid when code field is empty' do
      @paste.should_not be_valid
      @paste.save
      @paste.errors.count.should == 1
    end

    it 'should be invalid when title length is larger than 46' do
      @paste.title = "1" * 46
      @paste.save
      @paste.errors.count.should == 2
    end

    it 'should contain language field with its defaults (\"text\")' do
      @paste.language.should == 'text'
    end
  end

  it 'should be valid if contains just a code' do
    @paste = Paste.new(code: "some code")
    @paste.should be_valid
  end
end
