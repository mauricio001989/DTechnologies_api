require 'rails_helper'

describe Api::V1::UsersController do
  describe 'POST #create' do
    subject(:http_request) { post :create, params: params }

    let(:params) do
      {
        user: {
          email: 'mao@starwars.com',
          document: '12345678'
        }
      }
    end

    context 'when user is correct' do
      before do
        params[:user].update(name: 'mao')
        http_request
      end

      it 'responds with created status code' do
        expect(response).to have_http_status(:created)
      end

      it 'validate in databse' do
        expect(User.last.email).to eq('mao@starwars.com')
      end
    end

    context 'when user is not correct' do
      before do
        http_request
      end

      it 'responds with created unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #index' do
    subject(:http_request) { get :index }

    context 'when get all users' do
      let!(:user) { create_list(:user, 3, :with_project) }

      before do
        http_request
      end

      context 'validate state code' do
        it 'white responds ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'when valid the total users' do
          expect(JSON(response.body)['Users'].count).to be User.count
        end
      end
    end
  end

  describe 'GET #show' do
    subject(:http_request) { get :show, params: params }

    let(:params) { { id: user.last.id } }

    context 'when valid a user' do
      let!(:user) { create_list(:user, 3) }

      before { http_request }

      context 'validate state code' do
        it 'when responds ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'when user id is valid' do
          expect(JSON(response.body)['id']).to eq(params[:id])
        end
      end
    end
  end

  describe 'PUTS #update' do
    subject(:http_request) { patch :update, params: { id: id, user: params_name } }

    let!(:user) { create_list(:user, 3) }
    let(:id) { User.last.id }

    context 'when valid a user' do
      let(:params_name) { { name: Faker::Name.name } }
      before { http_request }

      context 'validate state code' do
        it 'when responds ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'when user name is valid' do
          expect(User.last.name).to eq(params_name[:name])
        end
      end
    end

    context 'when is not valid a user update' do
      let(:params_name) { { email: 'email' } }
      before { http_request }

      context 'validate state code' do
        it 'when responds unprocessable entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
