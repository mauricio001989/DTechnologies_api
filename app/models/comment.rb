class Comment < ApplicationRecord
  # == Callbacks ============================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :task

  # == Validations ==========================================================
  validates :comment, :task, presence: true

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end