class ActivitiesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  expose :user

  def new
    @activity = user.activities.new
  end

  def create
    @activity = user.activities.create(activity_params)
    if @activity.valid?
      redirect_to user_path(user)
    else
      respond_to do |format|
        format.js { render layout: false }
      end
    end
  end

  def index
    if params[:latitude] && params[:longitude]
      @activities = Activity.nearby(params[:latitude].to_f, params[:longitude].to_f)
    else
      @activities = Activity.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @activities, :methods => [:image_url] }
    end
  end

  def show
    activity = Activity.find(params[:id])
    happening_at_string = activity.happening_at_string

    respond_to do |format|
      format.json { render json: {happening_at: happening_at_string } }
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to user_path(current_user)
  end

  private

  def activity_params
    params.require(:activity).permit(
      :title,
      :description,
      :image,
      :location,
      :public,
      :latitude,
      :longitude,
      :happening_at_string
    )
  end
end
