# frozen_string_literal: true

class SmallRoomsController < ApplicationController
  before_action :set_small_room, only: %i[show edit update destroy]

  load_and_authorize_resource

  def index
    @small_rooms = SmallRoom.all.where(bookable: 'SI')
  end

  def index_regular
    @small_rooms = SmallRoom.all.where(bookable: 'SI')
  end

  def mobile_index
    @q = SmallRoom.ransack(params[:q])
    @small_rooms = @q.result(distinct: true).order(start_time: 'ASC').where(bookable: 'SI').limit(25)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show; end

  def new
    @small_room = SmallRoom.new
  end

  def edit; end

  def create
    @small_room = SmallRoom.new(small_room_params)
    respond_to do |format|
      if @small_room.save
        format.html { redirect_to @small_rooms, notice: 'successfully created.' }
        format.json { render :show, status: :created, location: @small_room }
      else
        format.html { render :new }
        format.json { render json: @small_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @small_room.update(small_room_params)
        format.js {}
        format.html { redirect_to @small_rooms, notice: 'small room was successfully updated.' }
        format.json { render :show, status: :ok, location: @small_room }
      else
        format.js {}
        format.html { render :edit }
        format.json { render json: @small_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @small_room.destroy
    respond_to do |format|
      format.html { redirect_to small_rooms_url, notice: 'small room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_small_room
    @small_room = SmallRoom.find(params[:id])
  end

  def small_room_params
    params.require(:small_room).permit(:name, :start_time, :end_time, :bookable, :booked, :category_id, :booking_reason, :booking_person)
  end
end
