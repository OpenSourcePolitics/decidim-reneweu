# frozen_string_literal: true

# This migration comes from decidim_debates (originally 20181003081235)

class FixUserGroupsIdsOnDebates < ActiveRecord::Migration[5.2]
  def change
    Decidim::UserGroup.find_each do |group|
      old_id = group.extended_data['old_user_group_id']
      next unless old_id

      Decidim::Debates::Debate
        .where(decidim_user_group_id: old_id)
        .update_all(decidim_user_group_id: group.id)
    end
  end
  # rubocop:enable Rails/SkipsModelValidations
end
