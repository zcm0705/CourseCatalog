module CurrentEnrollment
  extend ActiveSupport::Concern

  private

    def set_cart
      @enrollment = Enrollment.find(session[:enrollment_id])
    rescue ActiveRecord::RecordNotFound
      @enrollment = Enrollment.create
      session[:enrollment_id] = @enrollment.id
    end
  end
