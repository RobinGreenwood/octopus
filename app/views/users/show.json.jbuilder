json.current_user @user
json.current_user do
  json.firstname @user.first_name
  json.lastname @user.last_name
  json.username @user.username
  json.user_id @user.id


  json.cards(@user.cards) do |card|
    json.id card.id
    json.number card.number
    json.cvv card.cvv
  end
end
