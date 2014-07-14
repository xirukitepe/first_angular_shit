class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]

  # GET /magazines
  def index
    @magazines = Magazine.all

    respond_to do |format|
      format.html { }

      # format.json { render json: @magazines, root: false, each_serializer: MagazineSerializer }
      format.json { render json: @magazines, each_serializer: MagazineSerializer }

    end
  end

  # GET /magazines/1
  def show
    respond_to do |format|

      format.html { }

      format.json { render json: @magazine, root: false }

    end
  end

  # GET /magazines/new
  def new
    @magazine = Magazine.new
  end

  # GET /magazines/1/edit
  def edit
  end

  # POST /magazines
  def create
    @magazine = Magazine.new(magazine_params)

    if @magazine.save
      redirect_to @magazine, notice: 'Magazine was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /magazines/1
  def update
    if @magazine.update(magazine_params)
      redirect_to @magazine, notice: 'Magazine was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /magazines/1
  def destroy
    @magazine.destroy

    respond_to do |format|
      format.html {
        redirect_to books_url, notice: 'Mag was deleted'
      }

      format.json { render json: { message: "Mag was deleted" } }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def magazine_params
      params.require(:magazine).permit(:title, :author)
    end
end
