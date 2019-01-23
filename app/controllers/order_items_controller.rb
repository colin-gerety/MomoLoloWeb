class OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    if (params['item_name'].blank?)
      @order_items = OrderItem.all
    else
      @order_items = OrderItem.order(:name).where("name like ?", "%#{params['item_name']}%")
    end
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
    @order_item.supplier_items.build
  end

  # GET /order_items/1/edit
  def edit
    @order_item.supplier_items.build
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = OrderItem.new(order_item_params)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order_item, notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    autocomplete_limit = 5
    @items = OrderItem.order(:name).where("name like ?", "%#{params['term']}%").limit(autocomplete_limit)
    render json: @items.map(&:name)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
      @suppliers = Supplier.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:_destroy, :name, :category, :item_id, :description, supplier_items_attributes: [:_destroy, :id, :supplier_id, :order_item_id, :rank, :note, supplier_attributes: [:id]])
    end
end
