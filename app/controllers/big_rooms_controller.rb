# frozen_string_literal: true

class BigRoomsController < ApplicationController
  before_action :set_big_room, only: %i[show edit update destroy]

  def index
    @big_rooms = BigRoom.all.where(bookable: 'SI')
  end

  def index_regular
    @big_rooms = BigRoom.all.where(bookable: 'SI')
  end

  def mobile_index
    @q = BigRoom.ransack(params[:q])
    @big_rooms = @q.result(distinct: true).order(start_time: 'ASC').where(bookable: 'SI').limit(11)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show; end

  def new
    @big_room = BigRoom.new
  end

  def edit; end

  def create
    @big_room = BigRoom.new(big_room_params)
    respond_to do |format|
      if @big_room.save
        format.html { redirect_to @big_rooms, notice: 'Big room was successfully created.' }
        format.json { render :show, status: :created, location: @big_room }
      else
        format.html { render :new }
        format.json { render json: @big_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @big_room.update(big_room_params)
        format.js {}
        format.html { redirect_to @big_rooms, notice: 'Big room was successfully updated.' }
        format.json { render :show, status: :ok, location: @big_room }
      else
        format.js {}
        format.html { render :edit }
        format.json { render json: @big_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @big_room.destroy
    respond_to do |format|
      format.html { redirect_to big_rooms_url, notice: 'Big room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_big_room
    @big_room = BigRoom.find(params[:id])
  end

  def big_room_params
    params.require(:big_room).permit(:name, :start_time, :end_time, :bookable, :booked, :category_id, :booking_reason, :booking_person)
  end
end
