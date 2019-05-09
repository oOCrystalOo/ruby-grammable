class GramsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @grams = Gram.all
  end
  
  def new
    @gram = Gram.new
  end
  
  def create
    @gram = current_user.grams.create(gram_params)
    if @gram.invalid?
      render :new, status: :unprocessable_entity
    else
      redirect_to root_path
    end
  end
  
  def show
    @gram = Gram.find_by_id(params[:id])
    return render_status(:not_found) if @gram.blank?
  end
  
  def edit
    @gram = Gram.find_by_id(params[:id])
    return render_status(:not_found) if @gram.blank?
    return render_status(:forbidden) if @gram.user != current_user
  end
  
  def update
    @gram = Gram.find_by_id(params[:id])
    return render_status(:not_found) if @gram.blank?
    return render_status(:forbidden) if @gram.user != current_user
    
    @gram.update_attributes(gram_params)
    
    if @gram.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @gram = Gram.find_by_id(params[:id])
    return render_status(:not_found) if @gram.blank?
    return render_status(:forbidden) if @gram.user != current_user
    
    @gram.destroy
    redirect_to root_path
  end
  
  private
  def gram_params
    params.require(:gram).permit(:message, :user, :picture)
  end
  
  def render_status(status)
    render plain: "#{status.to_s.titleize}", status: status
  end
end
