class WorkPiecesController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  # GET /work_pieces
  # GET /work_pieces.xml
  def index
    @work_pieces = WorkPiece.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @work_pieces }
    end
  end

  # GET /work_pieces/1
  # GET /work_pieces/1.xml
  def show
    @work_piece = WorkPiece.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work_piece }
    end
  end

  # GET /work_pieces/new
  # GET /work_pieces/new.xml
  def new
    @work_piece = WorkPiece.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work_piece }
    end
  end

  # GET /work_pieces/1/edit
  def edit
    @work_piece = WorkPiece.find(params[:id])
  end

  # POST /work_pieces
  # POST /work_pieces.xml
  def create
    @work_piece = WorkPiece.new(params[:work_piece])

    respond_to do |format|
      if @work_piece.save
        format.html { redirect_to(@work_piece, :notice => 'Work piece was successfully created.') }
        format.xml  { render :xml => @work_piece, :status => :created, :location => @work_piece }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work_piece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /work_pieces/1
  # PUT /work_pieces/1.xml
  def update
    @work_piece = WorkPiece.find(params[:id])

    respond_to do |format|
      if @work_piece.update_attributes(params[:work_piece])
        format.html { redirect_to(@work_piece, :notice => 'Work piece was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_piece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /work_pieces/1
  # DELETE /work_pieces/1.xml
  def destroy
    @work_piece = WorkPiece.find(params[:id])
    @work_piece.destroy

    respond_to do |format|
      format.html { redirect_to(work_pieces_url) }
      format.xml  { head :ok }
    end
  end
end
