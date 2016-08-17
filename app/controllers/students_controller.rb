class StudentsController < ApplicationController
  def index
    render template: 'students/index.html.erb', locals: {
      students: Student.all
    }
  end

  def show
      Student.find(params[:id])
    if Student.exists?(params[:id])
      render locals: { student: student.find(params[:id])}
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      student: Student.new
    }
  end

  def create
    student = Student.new(student_params)
    student.name = params[:student][:name]
    if student.save
      redirect_to student
    else
      render :new
    end
  end

  def edit
    render locals: {
      student: Student.find(params[:id])
    }
  end

  def update
    student = Student.find(params[:id])
    if student.update(student_params)
      redirect_to student
    else
      render :edit
    end
  end

  def destroy
    if student.delete
      flash[:notice] = "Student information deleted"
      redirect_to student
    else
      flash[:alert] = "Could not be deleted due to errors"
    end
  end

  private
  def student_params
    params.require(:student).permit(:name)
  end
end
