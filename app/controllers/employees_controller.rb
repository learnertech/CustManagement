class EmployeesController < ApplicationController
  helper_method :total_salary
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
   # debugger
   @employee = Employee.create(employee_params)
   redirect_to root_path
 end

 def edit
  @employee = Employee.find_by_id(params[:id])
end
def update
  @employee = Employee.find_by_id(params[:id])
  @employee.update(employee_params)
  redirect_to root_path
end

def show
end

def destroy
  emp = Employee.find_by_id(params[:id])
  emp.destroy
  redirect_to employees_path
end

def add_contact
 debugger
end

def total_salary(sal,da,ta)
  if sal.present? && da.present? && ta.present?
    d_allowance = (sal*da)/100
    t_allowance = (sal*ta)/100
    return sal+d_allowance+t_allowance
  end
end

private

def employee_params
 params.require(:employee).permit(:name,:phone_number,:base_salary,:address,:dob,:da,:ta,:salute,:sex)
end

end
