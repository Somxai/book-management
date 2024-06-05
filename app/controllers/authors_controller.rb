class AuthorsController < ApplicationController

  def authors
    @authors = Author.all
  end

  def show
   @author = Author.find(params[:id])
  end

  def new
   @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author, notice: "save author successfully"
    else
      redirect_to :new , notice: "unable to save"
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)

      redirect_to authors_authors_path, notice: "Update successfully"
    else

      redirect_to edit: , notice: "unable to update author"
    end

  end

  def destroy
    @author = Author.find(params[:id])

    if @author.destroy
      redirect_to authors_authors_path , notice: "author deleted"
    else
      redirect_to authors_authors_path, notice: "unable to delete"
    end


  end

  private

  def author_params
    params.require(:author).permit(:name , :email)
  end

end
