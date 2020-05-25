require 'rails_helper'

describe Api::V1::TasksController do
  describe 'POST #create' do
    subject(:http_request) { post :create, params: { project_id: project.id, task: task } }
    let(:project) {create(:project, :with_task)}
    let(:task) do
      {
        deadline: "23-06-2020",
        description: "hola 444"
      }
    end
    context 'when project and task is correct' do
      before { http_request }
      it 'responds with created status code' do
        expect(response).to have_http_status(:created)
      end

      it 'validate in database' do
          expect(project.tasks.count).to be 2
      end
    end
  end

  describe 'GET #index' do
    subject(:http_request) { get :index, params: { project_id: project.id } }
    let(:project) { create(:project, :with_task) }
    let!(:task) {create_list(:task, 3, project: project)}
    

    context 'validate state code' do
      before do
       task
       http_request
      end

      it 'white responds ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'when valid the total project tasks' do
       expect(JSON(response.body)["id: = #{project.id}, name: #{project.name}"].count).to be 4
      end
    end
  end

  describe 'GET #show' do
  subject(:http_request) { get :show, params: { project_id: project.id, id: task.last.id } }
    let(:project) { create(:project, :with_task) }
    let!(:task) {create_list(:task, 3, project: project)}
    

    context 'validate state code' do
      before do
       http_request
      end

      it 'white responds ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'when valid the tasks id' do
       expect(JSON(response.body)['id']).to be(task.last.id)
      end
    end
  end

  describe 'PUTS #update' do
  end
end
