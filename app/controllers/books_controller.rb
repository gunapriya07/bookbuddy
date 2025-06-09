class BooksController < ApplicationController
  before_action :require_login
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books
  def index
    @books = current_user.books
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
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
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    # Set book only if it belongs to current_user
    def set_book
      @book = current_user.books.find(params[:id])
    end

    # Strong parameters
    def book_params
      params.require(:book).permit(:title, :author, :genre, :notes)
    end

    # Require login
    def require_login
      redirect_to login_path, alert: "Please log in first" unless current_user
    end
end
