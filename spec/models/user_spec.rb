require 'spec_helper'

describe User do
  it { should have_and_belong_to_many :adventures}
  it { should have_many :reviews }

end
