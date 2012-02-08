class PastesController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, except: [ :index, :new, :show , :create ]
  respond_to :html, :text, :js, :json, :xml, :only => :show

  def index
    if user_signed_in?
      @pastes = current_user.pastes.desc.limit(10)
    else
      @pastes = Paste.all.desc.limit(10)
    end
  end

  def new
  end

  def show
    respond_with(@paste) do |format|
      format.json { render :inline => @paste.to_json(:only => [ :title, :code ]) }
      format.text { render :inline => @paste.code }
      format.xml  { render :inline => @paste.to_xml(:only => [ :title, :code ]) }
    end
  end

  def create
    @paste.user = current_user if current_user
    if @paste.save
      redirect_to @paste
    else
      render :new
    end
  end

  def update
    if @paste.update_attributes(params[:paste])
      flash[:notice] = "Successfully updated paste."
      redirect_to @paste
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @paste.destroy
    flash[:notice] = "Successfully destroyed paste."
    redirect_to pastes_url
  end
end
