class WorkGraphicsController < ApplicationController

  def new
    @work_graphic = WorkGraphic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work_graphic }
    end
  end

  def create
    @work_piece = WorkPiece.find(params[:work_piece_id])
    @work_graphic = @work_piece.work_graphics.create(params[:work_graphic])
    redirect_to post_path(@work_piece)
  end

end
