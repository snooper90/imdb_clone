class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @actor.update_attributes(actor_params)
        format.html { redirect_to @actor, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def index
    @actors = Actor.all
  end

  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_path, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :year_of_birth, :thumbnail)
  end
  def set_actor
    @actor = Actor.find(params[:id])
    if !@actor
      redirect_to new_profile_path and return
    end
  end

end
