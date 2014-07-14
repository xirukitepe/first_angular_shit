class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    @books = Book.all

    # respond_to do |format|

    #   format.html { }

    #   format.json { render json: @books }

    # end

    respond_to do |format|

      format.html {

        # @books_json = @books.map{ |b| BookSerializer.new(b).serializable_hash }

        @urls = {

          books: books_path

        }

      }

      format.json { render json: @books }

    end
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        #redirect_to @book, notice: 'Book was successfully created.'
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book }
      else
        # render action: 'new'
        
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # def update
  #   if @book.update(book_params)
  #     redirect_to @book, notice: 'Book was successfully updated.'
  #   else
  #     render action: 'edit'
  #   end
  # end

  # # DELETE /books/1
  def destroy
    @book.destroy
    # redirect_to books_url, notice: 'Book was successfully destroyed.'
    respond_to do |format|
      format.html {
        redirect_to books_url, notice: 'Book was deleted'
      }

      format.json { render json: { message: "Book was deleted" } }

    end
  end

  def update
    respond_to do |format|

      if @book.update(book_params)

        format.html { redirect_to @book, notice: 'Book was successfully updated.' }

        format.json { render json: @book }

      else

        format.html { render action: 'edit' }

        format.json { render json: @book.errors, status: :unprocessable_entity }

      end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
