class Admin::FreelancersController < Admin::BaseController



  def new
    @freelancer = Freelancer.new
  end

  def create

    @category= Category.find_by(title: category_params[:category])
    @freelancer = @category.freelancers.new(freelancer_params)

    if @freelancer.save
      flash[:success] = "You succefully created #{@freelancer.name}"
      redirect_to freelancer_path(@freelancer)
    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end

  private

  def freelancer_params
    params.require(:freelancer).permit(:name, :description, :price, :avatar)
  end

  def category_params
    params.require(:freelancer).permit(:category)
  end

end
