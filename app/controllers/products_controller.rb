class ProductsController < ApplicationController

  before_action :ensure_currect_user,only: [:edit,:update,:destroy]

  def index_Top_page
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
    @parents = Category.all.order("id ASC").limit(13)
  end

  def index_all
    @parents = Category.all.order("id ASC").limit(13)
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
  end

  def new 
    if user_signed_in?
      @product=Product.new
      @product.images.build
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    else
      redirect_to user_session_path
    end
  end

  def create
    @product = Product.new(product_params)
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @category = Category.find((@product).category_id)
    grandchild_category = @product.category
    child_category = grandchild_category.parent
    # 親カテゴリーの配列を取得する
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    # 子カテゴリーの配列を取得する
    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end
    # 孫カテゴリーの配列を取得する
    @category_grandchildren_array = []
    Category.where(ancestry: @category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    @product = Product.find(params[:id])
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    if @product.update(product_params)
      redirect_to root_path
    else
      redirect_to edit_product_path(@product)
    end
  end

  def show
    @parents = Category.all.order("id ASC").limit(13)
    @product = Product.find(params[:id])
    @image = @product.images.all
    @category = Category.find((@product).category_id)
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
     #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def buy
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path
    else
      render product_path(params[:id])
    end
  end

  def ensure_currect_user
    @product = Product.find_by(id: params[:id])
    if @product.user_id != current_user.id
    redirect_to root_path
    end
  end
  
  private

  def product_params
    params.require(:product).permit( :name, :detail, :price, :category_id, :brand_id, :condition, :city, :fee_payer, :delivery, images_attributes: [:images,:id,:_destroy]).merge(user_id: current_user.id)
  end
end
