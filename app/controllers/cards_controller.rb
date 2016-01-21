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
      flash[:success] = "You've successfully added your card"
      render '/users/show'
    else
      render 'new'
    end
  end

  private

  def card_params
    params.require(:card).permit(:number, :cvv, :user_id)
  end
end
