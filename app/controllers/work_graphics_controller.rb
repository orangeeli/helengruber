class WorkGraphicsController < ApplicationController
  before_filter :authenticate
  def create
    @work_piece = WorkPiece.find(params[:work_piece_id])

    @work_graphic = @work_piece.work_graphics.create(params[:work_graphic])
    # redirect_to work_piece_path(@work_piece)
    
    render :json => @work_graphic
  end

  def destroy
    work_graphic = WorkGraphic.find(params[:id])
    work_piece = WorkPiece.find(work_graphic.work_piece_id)
    if work_graphic
      work_piece.work_graphics.delete(work_graphic)
      work_graphic_id = work_graphic.id
      work_graphic_name = work_graphic.graphic_file_name
      work_graphic.destroy
      render :json => {:response => {:message =>  "Work graphic #{work_graphic_name} was successfully deleted", :work_graphic_id => work_graphic_id, :work_graphic_name => work_graphic_name}}, :status => :ok
    else
      render :json => {:response => {:message =>  'There was no work graphic to be deleted'}}, :status => :ok
    end
  end
end
