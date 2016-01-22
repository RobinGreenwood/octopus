class CardsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    @user = current_user
    @card = Card.find_by_id(params[:id])
  end
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      render '/users/show'
    else
      render 'new'
    end
  end

  def update
    @card = Card.find_by_id(params[:id])
    if @card.update(card_params)
      render '/users/show'
    else
      render 'new'
    end

  private

  def card_params
    params.require(:card).permit(:number, :cvv, :user_id)
  end
end
