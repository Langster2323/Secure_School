class SchoolsController < ApplicationController
  def index
    render template: 'schools/index.html.erb', locals: {
      schools: School.all
    }
  end

  def show
    binding.pry
      School.find(params[:id])
    if School.exists?(params[:id])
      render template: 'school/show.html.erb', locals: { school: School.find(params[:id])}
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      school: School.new
    }
  end

  def edit
    render locals: {
      school: School.find(params[:id])
    }
  end

  def create
    school = School.new
    if school.save
      redirect_to school
    else
      flash[:alert] = "Could not be saved due to errors"
      render :new
    end
  end

  def update
    school = School.find(params[:id])
    if school.updte(school_params)
      redirect_to school
    else
      render :edit
    end
  end

  def destroy
    if school.delete
      flash[:notice] = "School information deleted"
      redirect_to root_path
    else
      flash[:alert] = "Could not be deleted due to errors"
    end
  end

  private
  def school_params
    params.require(:school).permit(:name)
  end
end
