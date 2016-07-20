class TeachersController < ApplicationController
  def index
    render template: 'teachers/index.html.erb', locals: {
      teacher: Teacher.all
    }
  end

  def new
    render locals: {
      teacher: Teacher.new
    }
  end

  def edit
    render locals: {
      teacher: Teacher.find(oarans[:id])
    }
  end

  def show
    binding.pry
    if Teacher.exists?(params[:id])
      render template: 'teachers/show.html.erb', locals: { teacher: Teacher.find(params[:id])}
    else
      render html: "Not Found", status: 404
    end
  end

    def create
      teacher = Teacher.new
      teacher.name = params[:teacher][:name]
      if teacher.save
        redirect_to_teacher_path(teacher)
      else
        flash[:alert] = "Could not be saved dye ti errors"
        render template: 'teacher.new.html.erb', locals: {
          teacher: teacher
        }
      end
    end
    def update
      teacher = Teacher.find(params[:id])
      teacher.name = params[:teacher][:name]
    end

    private
    def teacher_params
      params.require(:teacher).permit(:name)
    end
end
