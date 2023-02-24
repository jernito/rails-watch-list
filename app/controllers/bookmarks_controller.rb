class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def  create
    @bookmark = Bookmark.new(params_bookmarks)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_bookmarks
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
