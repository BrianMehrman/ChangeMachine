class CoinSetsController < ApplicationController
  # GET /coin_sets
  # GET /coin_sets.json
  def index
    @coin_sets = CoinSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coin_sets }
    end
  end

  # GET /coin_sets/1
  # GET /coin_sets/1.json
  def show
    @coin_set = CoinSet.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coin_set }
    end
  end

  # GET /coin_sets/new
  # GET /coin_sets/new.json
  def new
    @coin_set = CoinSet.new
    @coin = Coin.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coin_set }
    end
  end

  # GET /coin_sets/1/edit
  def edit
    @coin_set = CoinSet.find(params[:id])
    @coin = Coin.new
    
  end

  # POST /coin_sets
  # POST /coin_sets.json
  def create
    @coin_set = CoinSet.new(params[:coin_set])

    respond_to do |format|
      if @coin_set.save
        format.html { redirect_to root_path, notice: 'Coin set was successfully created.' }
        format.json { render json: @coin_set, status: :created, location: @coin_set }
      else
        format.html { render action: "new" }
        format.json { render json: @coin_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coin_sets/1
  # PUT /coin_sets/1.json
  def update
    @coin_set = CoinSet.find(params[:id])
    
    respond_to do |format|
      if @coin_set.update_attributes(params[:coin_set])
        # an update should be coming from the coin_set show page.
        format.html { redirect_to @coin_set, notice: 'Coin set was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @coin_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coin_sets/1
  # DELETE /coin_sets/1.json
  def destroy
    @coin_set = CoinSet.find(params[:id])
    @coin_set.destroy

    respond_to do |format|
      format.html { redirect_to coin_sets_url }
      format.json { head :ok }
    end
  end
end
