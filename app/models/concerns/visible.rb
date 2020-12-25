module Visible
  extend ActiveSupport::Concern

  include do
    VALID_STATUSES = ['public', 'private', 'archived']

    validates :status, in: VALID_STATUSES
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end