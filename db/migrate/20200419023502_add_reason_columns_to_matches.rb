class AddReasonColumnsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :cancellation_reason, :text, after: :status
    add_column :matches, :cancelled_at, :datetime
    add_column :matches, :postponed_reason, :text
    add_column :matches, :postponed_at, :datetime
  end
end
