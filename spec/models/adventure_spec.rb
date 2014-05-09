require 'spec_helper'

describe Adventure do
  it { should have_and_belong_to_many :users}
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should have_many :reviews }

  describe '.search_model' do
    it 'should query the db by the state and category parameters selected by the user' do
      adventure1 = Adventure.create(description: "fun", state: 'Oregon', category: 'rafting', price: 145, title: 'amazing')
      adventure2 = Adventure.create(description: "fun", state: 'Oregon', category: 'climbing', price: 145, title: 'amazing')
      adventure3 = Adventure.create(description: "fun", state: 'California', category: 'rafting', price: 145, title: 'amazing')
      Adventure.search_model('Oregon', 'rafting').length.should eq 1
    end
    it 'should query the db by the state parameter only if no category paraemter is selected' do
      adventure1 = Adventure.create(description: "fun", state: 'Oregon', category: 'rafting', price: 145, title: 'amazing')
      adventure2 = Adventure.create(description: "fun", state: 'Oregon', category: 'climbing', price: 145, title: 'amazing')
      adventure3 = Adventure.create(description: "fun", state: 'California', category: 'rafting', price: 145, title: 'amazing')
      Adventure.search_model('California', 'false').length.should eq 1
    end
    it 'should query the db by the category parameter only if no state paraemter is selected' do
      adventure1 = Adventure.create(description: "fun", state: 'Oregon', category: 'rafting', price: 145, title: 'amazing')
      adventure2 = Adventure.create(description: "fun", state: 'Oregon', category: 'climbing', price: 145, title: 'amazing')
      adventure3 = Adventure.create(description: "fun", state: 'California', category: 'rafting', price: 145, title: 'amazing')
      Adventure.search_model('false', 'climbing').length.should eq 1
    end
    it 'should query the db by the default scope if no parameters are given' do
      adventure1 = Adventure.create(description: "fun", state: 'Oregon', category: 'rafting', price: 145, title: 'amazing')
      adventure2 = Adventure.create(description: "fun", state: 'Oregon', category: 'climbing', price: 145, title: 'amazing')
      adventure3 = Adventure.create(description: "fun", state: 'California', category: 'rafting', price: 145, title: 'amazing')
      Adventure.search_model('false', 'false').length.should eq 3
    end
  end
end
