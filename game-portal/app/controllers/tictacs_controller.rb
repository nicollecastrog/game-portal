class TictacsController < ApplicationController
  # GET /tictacs
  # GET /tictacs.json
  def index
    @tictacs = Tictac.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tictacs }
    end
  end

  # GET /tictacs/1
  # GET /tictacs/1.json
  def show
    @tictac = Tictac.find(params[:id])

  end

  # GET /tictacs/new
  # GET /tictacs/new.json
  def new
    @tictac = Tictac.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tictac }
    end
  end

  # GET /tictacs/1/edit
  def edit
    @tictac = Tictac.find(params[:id])
  end

  # POST /tictacs
  # POST /tictacs.json
  def create
    @tictac = Tictac.new(params[:tictac])
    @tictac.player1_id = current_user.id

    respond_to do |format|
      if @tictac.save
        format.html { redirect_to @tictac, notice: 'Tictac was successfully created.' }
        format.json { render json: @tictac, status: :created, location: @tictac }
      else
        format.html { render action: "new" }
        format.json { render json: @tictac.errors, status: :unprocessable_entity }
      end
    end
  end

  def join 
    @tictac = Tictac.find(params[:id])
    @tictac.player2_id = current_user.id
    @tictac.save
    redirect_to @tictac
  end

  # def move
  #   @tictac = Tictac.find(params[:id])
  #   @tictac.make_move(params[:square], current_user)
  # end

  # PUT /tictacs/1
  # PUT /tictacs/1.json
  def update
    @tictac = Tictac.find(params[:id])
    @tictac.make_move(params[:square].to_i, current_user)

    respond_to do |format|
      
      if @tictac.game_over? && @tictac.update_attributes(params[:tictac])
        format.html { redirect_to @tictac, notice: 'Tictac was successfully updated.' }
        format.json { head :no_content }
      elsif @tictac.game_over? == false && @tictac.update_attributes(params[:tictac])
        format.html { redirect_to action: "edit"}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tictac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tictacs/1
  # DELETE /tictacs/1.json
  def destroy
    @tictac = Tictac.find(params[:id])
    @tictac.destroy

    respond_to do |format|
      format.html { redirect_to tictacs_url }
      format.json { head :no_content }
    end
  end

end
