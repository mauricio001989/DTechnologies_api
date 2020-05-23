class User < ApplicationRecord
  # == Callbacks ============================================================
  before_save :downcase_email

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================
  validates :name, :document, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  private

  # == Instance Methods =====================================================
  def downcase_email
    email.downcase!
  end
end
