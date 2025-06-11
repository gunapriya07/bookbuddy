class DashboardController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @total_books = @user.books.count
    @recent_reviews = @user.reviews.order(created_at: :desc).limit(5)
  end

  private

  def require_login
    unless current_user
      redirect_to login_path, alert: "Please log in to access the dashboard."
    end
  end
end
