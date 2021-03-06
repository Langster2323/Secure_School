class TeachersController < ApplicationController
  def index
    render template: 'teachers/index.html.erb', locals: {
      teachers: Teacher.all
    }
  end

  def show
    if Teacher.exists?(params[:id])
      render locals: { teacher: teacher.find(params[:id])}
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      teacher: Teacher.new
    }
  end

    def create
      teacher = Teacher.new(teacher_params)
      if teacher.save
        redirect_to teacher
      else
      render :new
      end
    end

    def edit
      render locals: {
        teacher: Teacher.find(params[:id])
      }
    end

    def update
      teacher = Teacher.find(params[:id])
      if teacher.update(teacher_params)
        redirect_to teacher
      else
        render :edit
      end
    end

    private
    def teacher_params
      params.require(:teacher).permit(:name)
    end
end
