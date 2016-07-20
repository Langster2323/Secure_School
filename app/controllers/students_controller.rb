class StudentsController < ApplicationController
  def index
    render template: 'students/index.html.erb', locals: {
      student: Student.all?
    }
  end

  def show
    binding.pry
      Student.find(params[:id])
    if Student.exists?(params[:id])
      render template: 'students/show.html.erb', locals: { student: student.find(params[:id])}
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
    student = Student.new
    student.name = params[:student][:name]
    if school.save
      redirect_to_student_path(student)
    else
      flash[:alert] = "Could not be saved due to errors"
      render template: 'student/new.html.erb'
    end
  end

  def update
    student = Student.find(params[:id])
    student.name = pramas[:student]
    if student.save
      redirect_to_school_path(student)
    else
      render template: '/school/new.html.erb', locals: {
        student: student
      }
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
  def students_params
    params.require(:student).permit(:name)
  end
end
