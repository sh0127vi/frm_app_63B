class ProductsController < ApplicationController
  before_action :parents_category, only: [:index_Top_page, :index_all, :show, :search]
  before_action :set_product, only: [:show, :destroy]
  before_action :set_products_all, only: [:index_all, :index_Top_page]
  before_action :ensure_currect_user,only: [:edit,:update,:destroy]


  def index_Top_page
  end

  def index_all
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
    # 商品詳細に関するコントローラー
    @image = @product.images.all
    # コメントに関するコントローラー
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
    @comment = @product.comments.build
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

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render product_path(params[:id])
    end
  end

  def search
    @products = Product.search(params[:keyword]).order("created_at DESC").limit(25)
  end

  

  private
  def product_params
    params.require(:product).permit( :name, :detail, :price, :category_id, :brand_id, :condition, :city, :fee_payer, :delivery, images_attributes: [:images,:id,:_destroy]).merge(user_id: current_user.id)
  end

  def parents_category
    @parents = Category.order("id ASC").limit(13)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_products_all
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
  end
  
  def ensure_currect_user
    @product = Product.find_by(id: params[:id])
    if @product.user_id != current_user.id
       redirect_to root_path
    end
  end

end
