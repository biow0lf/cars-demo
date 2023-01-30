# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    @people = Person.page(params[:page])
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy!

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = t(".successful") }
      format.html { redirect_to people_path, status: :see_other, notice: t(".successful") }
    end
  end
end
