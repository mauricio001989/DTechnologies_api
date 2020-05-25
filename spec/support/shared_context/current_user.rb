shared_context 'wiht current user' do
  before do
    request.headers['X-current-user'] = current_user.id
  end

  let(:current_user) { create(:user) }
end
