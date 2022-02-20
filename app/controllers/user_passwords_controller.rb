class UserPasswordsController < ApplicationController

  def forgot
  if params[:email].blank? # check if email is present
    return render json: {error: 'Email non présent'}
  end

  @user = User.find_by(email: params[:email]) # if present find user by email

  if @user.present?
    @user.generate_password_token! #generate pass token
    UserMailer.reset_password_email(@user).deliver_now
    render json: {status: 'ok'}, status: :ok
  else
    render json: {error: ['Email non trouvé. Vérifiez puis recommencez']}, status: :not_found
  end
end

def reset
  token = params[:token].to_s

  if params[:email].blank?
    return render json: {error: 'Token non présent'}
  end

  user = User.find_by(reset_password_token: token)

  if user.present? && user.password_token_valid?
    if user.reset_password!(params[:password])
      render json: {status: 'ok'}, status: :ok
    else
      render json: {error: user.errors.full_messages}, status: :unprocessable_entity
    end
  else
    render json: {error:  ['Lien invalide ou expiré. Regénerez un nouveau lien.']}, status: :not_found
  end
end

end