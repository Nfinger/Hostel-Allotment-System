class Border < ApplicationRecord
  #before_save { self.email = email.downcase }
  validates :roll_no ,presence: true,length:{maximum:10},uniqueness:true
  validates :name,length:{maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }
                    #format: { with: VALID_EMAIL_REGEX }
                    #uniqueness: { case_sensitive: false }


  VALID_PHONE_REGEX=/\A[0-9]+\z/i
  validates :phone_no,length:{maximum:10}
  #format:{with:VALID_PHONE_REGEX}
  
  has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  #associations
  belongs_to :hostel , polymorphic:true
  

  belongs_to :student_result

  #validate :border_count_within_limit, :on => :create, :on => :update

  #def border_count_within_limit
   # if self.hostel.borders(:reload).length >= self.hostel.no_of_rooms
    #  errors.add(:base, "Exceeded thing limit")
    #end
  #end

end
