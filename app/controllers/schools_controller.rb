class SchoolsController < ApplicationController
  def index
    render template: 'schools/index.html.erb', locals: {
      schools: School.all
    }
  end

  def show
    if School.exists?(params[:id])
      render template: 'schools/show.html.erb', locals: { school: School.find(params[:id])}
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      school: School.new
    }
  end

  def create
    school = School.new(school_params)
    if school.save
      redirect_to school
    else
      flash[:alert] = "Could not be saved due to errors"
      render :new
    end
  end

  def edit
    render locals: {
      school: School.find(params[:id])
    }
  end

  def update
    school = School.find(params[:id])
    if school.update(school_params)
      redirect_to school
    else
      render :edit
    end
  end

  def destroy
    if School.exists?(params[:id])
      School.destroy(params[:id])
      flash[:notice] = "School deleted."
      redirect_to schools_url
    else
      flash[:alert] = "Could not delete school. Due to error."
    end
  end

  private
  def school_params
    params.require(:school).permit(:name)
  end
end
