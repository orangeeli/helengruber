class WorkGraphicsController < ApplicationController

  def create
    @work_piece = WorkPiece.find(params[:work_piece_id])
    @work_graphic = @work_piece.work_graphics.create(params[:work_graphic])
    redirect_to work_piece_path(@work_piece)
  end

end