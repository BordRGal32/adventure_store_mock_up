require 'spec_helper'

describe Review do
 it { should belong_to :adventure }
 it { should belong_to :user }
end
