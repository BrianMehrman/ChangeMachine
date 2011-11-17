class CollectionsController < ApplicationController
  # GET /colletion
  # GET /collection.json
  before_filter :require_coin_set
  
  def require_coin_set
    if params[:coin_set_id]
      @coin_set = CoinSet.find(params[:coin_set_id])
    end
  end
  
  def index
    @collections = Collection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collections }
    end
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collection = Collection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/new
  # GET /collections/new.json
  def new
    @collection = Collection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
  end

  # POST /collections
  # POST /collections.json
  def create
    coin = {:name => params[:name], :value => params[:value]}
    @coin = Coin.find_or_create_by_name(params[:name])
    
    if @coin.new_record?
      @coin.value = params[:value]
      @coin.save
    end
    @collection = Collection.new(:coin => @coin, :coin_set => @coin_set)
  
    respond_to do |format|
      if @collection.save 
        format.js
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render json: @collection, status: :created, location: @collection }
      else
        format.js
        format.html { render action: 'new'}
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.json
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:coin])
        formart.js
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection = Collection.find(params[:id])
    # store coin and set for js
    @coin = @collection.coin
    @coin_set = @collection.coin_set
    @collection.destroy
    
    respond_to do |format|
      format.js
      format.html { redirect_to collections_url }
      format.json { head :ok }
    end
  end
end
