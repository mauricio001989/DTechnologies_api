require 'rails_helper'

describe Project do
  context 'when create a project' do
    subject(:task) { build_stubbed(:task) }

    it { is_expected.to validate_presence_of(:deadline) }
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:comments) }
  end
end
