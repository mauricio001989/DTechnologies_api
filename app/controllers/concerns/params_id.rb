module ParamsId
  def project_id
    @project_id ||= params.require(:project_id)
  end

  def task_id
    @task_id ||= params.require(:task_id)
  end

  def comment_id
    @comment_id ||= params.require(:comment_id)
  end

  def params_id
    @params_id ||= params[:id]
  end
end
