class StudentsController < ApplicationController
  def index
	@students = Student.all
  end
  def new
  	@student = Student.new
  end
  def create
  	@student = Student.new(student_params)
    respond_to do |format|
    	if @student.save
    	     format.html { redirect_to @student, notice: 'Student was successfully created.'}
    	     format.json { render json: show, :status => :created, location: @student}
    	else
    		format.html { render action: 'new'}
    		format.json { render json: @student.errors, :status => :unprocessable_entity}
    	end
    end
  end
  def show
  	@student = Student.find(params[:id])
  end
  def edit
  	@student = Student.find(params[:id])
  end
  def update
  	@student = Student.find(params[:id])
  	 respond_to do |format|
    	if @student.update
    	     format.html { redirect_to @student, notice: 'Student was successfully updated.'}
    	     format.json { render json: show, :status => :created, location: @student}
    	else
    		format.html { render action: 'update'}
    		format.json { render json: @student.errors, :status => :unprocessable_entity}
    	end
    end
  end
  def destroy
  	@student = Student.find(params[:id])
  	@student.destroy
  	 redirect_to students_path
  end
  private
   def student_params
   	params.require(:student).permit(:name, :branch, :dob)
   end
end
