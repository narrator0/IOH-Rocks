class Admin::SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all
  end

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new speaker_params

    if @speaker.save
      redirect_to admin_speakers_path
    else
      render :new
    end
  end

  def edit
    @speaker = Speaker.find params[:id]
  end

  def update
    @speaker = Speaker.find params[:id]

    if @speaker.update_attributes speaker_params
      redirect_to admin_speakers_path
    else
      render :edit
    end
  end

  def destroy
    speaker = Speaker.find params[:id]

    speaker.destroy

    redirect_to admin_speakers_path
  end

  private

  def speaker_params
    params.require(:speaker).permit(
      :name, :gmail, :fb_link,
      :phone, :location, :ioh_url,
      :feedback, :speaker_school, :speaker_department
    )
  end
end
