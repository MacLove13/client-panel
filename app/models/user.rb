class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validate :password_complexity, if: -> { password.present? }

  private

  def password_complexity
    unless password.match?(/[a-z]/)
      errors.add(:password, "deve conter pelo menos uma letra minúscula")
    end
    unless password.match?(/[A-Z]/)
      errors.add(:password, "deve conter pelo menos uma letra maiúscula")
    end
    unless password.match?(/[0-9]/)
      errors.add(:password, "deve conter pelo menos um número")
    end
    unless password.match?(/[^a-zA-Z0-9]/)
      errors.add(:password, "deve conter pelo menos um caractere especial")
    end
  end
end
