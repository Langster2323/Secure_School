class StudentsController < ApplicationController
  def index
    render locals: {
      student: Student.all
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

  def edit
    render locals: {
      student: Student.find(params[:id])
    }
  end

  def create
    student = Student.new(student_params)
    if student.save
      redirect_to student
    else
      flash[:alert] = "Could not be saved due to errors"
      render :new
    end
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
    else
      flash[:alert] = "Could not be deleted due to errors"
    end
  end

  private
  def student_params
    params.require(:student).permit(:name)
  end
end
