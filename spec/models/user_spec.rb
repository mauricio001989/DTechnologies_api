require 'rails_helper'

describe User do
  context 'when create a user' do
    subject(:user) { build_stubbed(:user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:document) }

    it { is_expected.to have_many(:projects) }
    it { is_expected.to have_many(:tasks) }
  end
end
