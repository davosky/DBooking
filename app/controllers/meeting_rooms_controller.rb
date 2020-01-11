# frozen_string_literal: true

class MeetingRoomsController < ApplicationController
  before_action :set_meeting_room, only: %i[show edit update destroy]

  def index
    @meeting_rooms = MeetingRoom.all
  end

  def show; end

  def new
    @meeting_room = MeetingRoom.new
  end

  def edit; end

  def create
    @meeting_room = MeetingRoom.new(meeting_room_params)

    respond_to do |format|
      if @meeting_room.save
        format.html { redirect_to @meeting_room, notice: 'Meeting room was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room }
      else
        format.html { render :new }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting_room.update(meeting_room_params)
        format.js {}
        format.html { redirect_to @meeting_room, notice: 'Meeting room was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room }
      else
        format.js {}
        format.html { render :edit }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meeting_room.destroy
    respond_to do |format|
      format.html { redirect_to meeting_rooms_url, notice: 'Meeting room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_meeting_room
    @meeting_room = MeetingRoom.find(params[:id])
  end

  def meeting_room_params
    params.require(:meeting_room).permit(:code, :name, :description)
  end
end
