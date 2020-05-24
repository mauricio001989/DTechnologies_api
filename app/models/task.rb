class Task < ApplicationRecord
  # == Callbacks ============================================================

  # == Constants ============================================================

  # == Attributes ===========================================================
  enum state: {
    open: 0,
    close: 1
  }

  enum priority: {
    critical: 0,
    high: 1,
    medium: 2,
    low: 3
  }
  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :project

  # == Validations ==========================================================
  validates :deadline, :description, :project, presence: true
  validates :deadline, date: { after: Time.zone.today - 1 }

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
