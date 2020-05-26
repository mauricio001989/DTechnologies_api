require 'rails_helper'

describe Comment do
  context 'when create a comment' do
    subject(:comment) { build_stubbed(:comment) }

    it { is_expected.to validate_presence_of(:comment) }
    it { is_expected.to belong_to(:task) }
  end
end
