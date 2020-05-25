require 'rails_helper'

describe Project do
  context 'when create a user' do
    subject(:project) { build_stubbed(:project) }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to belong_to(:user) }
  end
end
