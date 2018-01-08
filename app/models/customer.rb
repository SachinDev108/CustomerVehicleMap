class Customer < ApplicationRecord

  # association
  has_many :vehicles, :dependent => :destroy

  accepts_nested_attributes_for :vehicles, allow_destroy: true

  #validations
  validate :validate_properties

  def validate_properties
    if address.blank? or lat.blank? or lng.blank?
      errors.add(:address, "is not valid")
    end
  end

  def self.search(params)
    if (params[:city].present? || params[:state].present? || params[:zip].present?)
      where('lower(city) = ?', params[:city].try(:downcase)).or(where('lower(state) = ?', params[:state].try(:downcase))).or(where('lower(zip) = ?', params[:zip].try(:downcase)))
    else
      all
    end
  end
end
