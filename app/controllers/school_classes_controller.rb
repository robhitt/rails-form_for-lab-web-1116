class SchoolClassesController < ApplicationController
  def index
    @school_classes = SchoolClass.all
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(school_class_params(:title, :room_number))
    @school_class.save
    redirect_to school_class_path(@school_class)
    #@school_class = SchoolClass.create(params(school_class[:title]), params(school_class[:room_number]))
  end

  def show
    indv_id
  end

  def edit
    indv_id
  end

  def update
    indv_id
    @school_class.update(school_class_params(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

  private

  def school_class_params(*args)
    params.require(:school_class).permit(*args)
  end

  def indv_id
    @school_class = SchoolClass.find(params[:id])
  end
end
