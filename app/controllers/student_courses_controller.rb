class StudentCoursesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    unless current_user.courses.include?(course)
    current_user.courses << course
    flash[:notice] = "You have successfuly signed up for #{course.name}"
      redirect_to current_user
    else 
      flash[:notice] = "Something went wrong with your enrollment"
      redirect_to root_path
    end
  end
end