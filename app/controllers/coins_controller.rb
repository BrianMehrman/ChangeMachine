class CoinsController < ApplicationController
  # GET /coins
  # GET /coins.json
  def index
    @coins = Coin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coins }
    end
  end

  # GET /coins/1
  # GET /coins/1.json
  def show
    @coin = Coin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coin }
    end
  end

  # GET /coins/new
  # GET /coins/new.json
  def new
    @coin = Coin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coin }
    end
  end

  # GET /coins/1/edit
  def edit
    @coin = Coin.find(params[:id])
  end

  # POST /coins
  # POST /coins.json
  def create
    @coin = Coin.new(params[:coin])

    respond_to do |format|
      if @coin.save
        format.html { redirect_to @coin, notice: 'Coin was successfully created.' }
        format.json { render json: @coin, status: :created, location: @coin }
      else
        format.html { render action: "new" }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coins/1
  # PUT /coins/1.json
  def update
    @coin = Coin.find(params[:id])

    respond_to do |format|
      if @coin.update_attributes(params[:coin])
        format.html { redirect_to @coin, notice: 'Coin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1
  # DELETE /coins/1.json
  def destroy
    @coin = Coin.find(params[:id])
    @coin.destroy

    respond_to do |format|
      format.html { redirect_to coins_url }
      format.json { head :ok }
    end
  end
end
