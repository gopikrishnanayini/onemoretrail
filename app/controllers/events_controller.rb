class EventsController < ApplicationController
  def index
  	@student = Student.find(params[:student_id])
  	@events = @student.events
  end
  def new
  	@student = Student.find(params[:student_id])
  	@event = @student.events.build
  end
  def create
  	@student = Student.find(params[:student_id])
  	@event = @student.events.build
  	respond_to do |format|
  		if @event.save
  			format.html { redirect_to student_events_path(@student, @event), notice: 'Event was successfully created.' }
  			format.json { render json: show, :status => :created, location: @event }
  		else
  			format.html { render action: 'new'}
  			format.json { render json: @event.errors, :status => :unprocessable_entity }
  		end
  	end
  end
  def show
  	@student = Student.find(params[:student_id])
  	@event = @student.events.find(params[:id])
  end
  def edit
  	@student = Student.find(params[:student_id])
  	@event = @student.events.find(params[:id])
  end
  def update
  	@student = Student.find(params[:student_id])
  	@event = @student.events.build
  	respond_to do |format|
  		if @event.save
  			format.html { redirect_to student_events_path(@student, @event), notice: 'Event was successfully updated.' }
  			format.json { render json: show, :status => :created, location: @event }
  		else
  			format.html { render action: 'update'}
  			format.json { render json: @event.errors, :status => :unprocessable_entity }
  		end
  	end
  end
  def destroy
  	@student = Student.find(params[:student_id])
  	@event = @student.events.find(params[:id])
  	@event.destroy
  	 redirect_to student_events_path
  	end
  private
  def event_params
  	params.require(:event).permit(:name, :organiser)
  end

end
