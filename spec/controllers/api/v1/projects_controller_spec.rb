require 'rails_helper'

describe Api::V1::ProjectsController do
  describe 'POST #create' do
    subject(:http_request) { post :create, params: params }

    let(:user) { create(:user) }
    let(:params) do
      {
        project: {
          name: 'project 1'
        }
      }
    end

    context 'when project is correct' do
      before do
        params[:project].update(user_id: user.id)
        http_request
      end

      it 'responds with created status code' do
        expect(response).to have_http_status(:created)
      end

      it 'validate in database' do
        expect(Project.last.name).to eq('project 1')
      end
    end

    context 'when project is not correct' do
      before { http_request }

      it 'responds with created unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #index' do
    subject(:http_request) { get :index }

    context 'when get all projects' do
      #TODO: expecteding policy for projects filter
      let!(:projects) { create_list(:user, 3, :with_project) }

      before do
        http_request
      end

      context 'validate state code' do
        it 'white responds ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'when valid the total project' do
          expect(JSON(response.body)['Projects'].count).to be 3
        end
      end
    end
  end

  describe 'GET #show' do
    subject(:http_request) { get :show, params: params }

    let(:params) { { id: projects.last.id } }

    context 'when valid a user' do
      let(:projects) { create_list(:project, 3) }

      before { http_request }

      context 'validate state code' do
        it 'when responds ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'when project id is valid' do
          expect(JSON(response.body)['id']).to eq(params[:id])
        end
      end
    end
  end

  describe 'PUTS #update' do
    subject(:http_request) { patch :update, params: { id: id, project: params_name } }

    let!(:project) { create_list(:project, 3) }
    let(:id) { Project.last.id }

    context 'when valid a project' do
      let(:params_name) { { name: Faker::Company.industry } }
      before { http_request }

      context 'validate state code' do
        it 'when responds ok' do
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
