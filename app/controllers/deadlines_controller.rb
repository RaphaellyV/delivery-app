class DeadlinesController < ApplicationController
  before_action :authenticate_user!
  before_action do 
    redirect_to new_user_session_path unless current_user
  end
  before_action :set_deadline, only: [:edit, :update]

  def index
    @deadlines = Deadline.all
  end

  def new
    @deadline = Deadline.new
  end

  def create
    deadline_params
    @deadline = Deadline.new(deadline_params)

    if @deadline.save()
      redirect_to deadlines_path, notice:'Prazo cadastrado com sucesso.'
    else
      flash.now[:alert]='Prazo não cadastrado.'
      render 'new'
    end
  end

  def edit; end

  def update
    deadline_params
    if @deadline.update(deadline_params)
      redirect_to deadlines_path, notice: 'Prazo atualizado com sucesso.'
    else
      flash.now[:alert] = 'Não foi possível atualizar o prazo.'
      render 'edit'
    end                                      
  end

  private

    def set_deadline
        @deadline = Deadline.find(params[:id])
    end

    def deadline_params
      params.require(:deadline).permit(:min_distance, :max_distance, :max_days)
    end
end