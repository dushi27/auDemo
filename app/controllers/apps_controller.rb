class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :destroy]

  def communication   
    @apps = App.where(skill: 'Communication')
    if @apps.empty?
      redirect_to apps_url, notice: 'No apps on the Communication catagory'    
    else
      render 'index'
    end
  end
  
  def behavior
    @apps = App.where(skill: 'Behavior Skills')
    if @apps.empty?
      redirect_to apps_url, notice: 'No apps on the Behavior catagory'    
    else
      render 'index'      
    end
  end
  
  def motor
    @apps = App.where(skill: 'Fine Motor Skills')
    if @apps.empty?
      redirect_to apps_url, notice: 'No apps on the Communication catagory'    
    else
      render 'index'
    end
  end
  
  def safty
    @apps = App.where(skill: 'Safty Skills')
    if @apps.empty?
      redirect_to apps_url, notice: 'No apps on the Safty catagory'    
    else
      render 'index'
    end
  end
  
  def living
    @apps = App.where(skill: 'Daily Living Skills')
    if @apps.empty?
      redirect_to apps_url, notice: 'No apps on the Daily Living catagory'    
    else
      render 'index'
    end
  end
  
  def index      
    @apps = App.all
      respond_to do |format|
          format.html
          format.pdf do 
               pdf = Prawn::Document.new
                    pdf.text 'Hello World'
                    send_data pdf.render, filename: "test.pdf", 
                                          type: "application/pdf",
                                          desposition: "inline"
          end
      end
  end

  def show
      raise params.inspect
      respond_to do |format|
          format.html
          format.pdf do 
               pdf = Prawn::Document.new
                    pdf.text 'show action'
                    send_data pdf.render, filename: "test.pdf", 
                                          type: "application/pdf",
                                          desposition: "inline"
          end
      end
  end

  def new
    @app = App.new
  end

  def edit
  end

  def create
    #raise params.inspect
    @app = current_user.apps.create(app_params)
   if (params["app"]["application_image"]).present?
     image =(params["app"]["application_image"]).read
     @app.images = Base64.encode64(image)
   end

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_app
      #raise params.inspect
     @app = App.find(params[:id])
    end

  def app_params
    params.require(:app).permit(:name, :skill, :video_link, :web_link, :price, :user_id, :images)
    end    
end
