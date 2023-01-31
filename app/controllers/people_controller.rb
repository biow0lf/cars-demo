# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    @people = Person.page(params[:page])
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_path(@person), notice: t(".successful")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to person_path(@person), notice: t(".successful")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy!

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = t(".successful") }
      format.html { redirect_to people_path, status: :see_other, notice: t(".successful") }
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :email, :phone)
  end
end
