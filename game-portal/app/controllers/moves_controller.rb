class MovesController < ApplicationController
  # GET /moves
  # GET /moves.json
  before_filter :load_tictac
  def index
    @move = @tictac.moves.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moves }
    end
  end



  # GET /moves/1
  # GET /moves/1.json
  def show
    @move = @tictac.moves.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @move }
    end
  end

  # GET /moves/new
  # GET /moves/new.json
  def new
    @move = @tictac.moves.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @move }
    end
  end

  # GET /moves/1/edit
  def edit
    @move = tictac.moves.find(params[:id])
  end

  # POST /moves
  # POST /moves.json
  def create
    @tictac = Tictac.find(params[:tictac_id])
    @move = @tictac.moves.new(params[:move])
    @move.artist = current_user

    respond_to do |format|
      if @move.save
        format.html { redirect_to (@tictac), notice: 'Move was successfully created.' }
        format.json { render json: [@tictac, @move], status: :created, location: [@tictac, @move] }
      else
        format.html { render action: "new" }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /moves/1
  # PUT /moves/1.json
  def update
    @move = tictac.moves.find(params[:id])

    respond_to do |format|
      if @move.update_attributes(params[:move])
        format.html { redirect_to [@tictac, @move], notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  def destroy
    @move = @tictac.moves.find(params[:id])
    @move.destroy

    respond_to do |format|
      format.html { redirect_to tictac_path(@tictac) }
      format.json { head :no_content }
    end
  end

  private

  def load_tictac
    @tictac = Tictac.find(params[:tictac_id])
  end
end