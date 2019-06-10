class DepartmentsController < ApplicationController

  def index
   @departments = Department.all.order("updated_at desc")
 end

 def new
   @department = Department.new
 end

 def create
    #debugger
    @department = Department.new(department_params)
    if @department.save
     redirect_to departments_path
   else
    render 'new'
   end
  end

  def edit
   @department = Department.find(params[:id])
  end

 def update
    #debugger
    @department = Department.find(params[:id])
    @department.update(department_params)
    redirect_to departments_path
  end

  def destroy
    #debugger
    @department = Department.find(params[:id])
    if @department.employees.present?
      redirect_to departments_path
    else
      @department.destroy
      redirect_to departments_path
    end
  end

  private

  def department_params
   params.require(:department).permit(:name)
 end

end