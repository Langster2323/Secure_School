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
    school.name = params[:school][:name]
    if school.save
      redirect_to_school_path(user)
    else
      flash[:alert] = "Could not be saved due to errors"
      render template: 'school/new.html.erb'
    end
  end

  # def update
  #   school = School.find(params[:id])
  #   school.name = pramas[:school]
  #   if school.save
  #     redirect_to_school_path(school)
  #   else
  #     render template: '/school/new.html.erb', locals: {
  #       school: school
  #     }
  #   end
  # end
  #
  # def destroy
  #   if school.delete
  #     flash[:notice] = "School information deleted"
  #   else
  #     flash[:alert] = "Could not be deleted due to errors"
  #   end
  # end

  private
  def school_params
    params.require(:school).permit(:name)
  end
end
