class DeadlinesController < ApplicationController
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
      flash.now[:notice]='Prazo não cadastrado.'
      render 'new'
    end
  end

  def edit; end

  def update
    deadlines_params
    if @price.update(deadlines_params)
      redirect_to deadlines_path, notice: 'Prazo atualizado com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível atualizar o Prazo.'
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