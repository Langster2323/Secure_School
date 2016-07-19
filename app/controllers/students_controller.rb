class StudentsController < ApplicationController
  def index
    render locals: {
      schools: School.all?
    }
  end

  def show
    binding.pry
    school: School.find(params[:id])
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

  def update
    student = Student.find(params[:id])
    student.name = pramas[:student]
    if student.save
      redirect_to_school_path(school)
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
end
