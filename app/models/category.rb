class Category < ApplicationRecord
  extend ActsAsTree::TreeView
  extend ActsAsTree::TreeWalker
  acts_as_tree order: 'name'
  validates :name, presence: true
  auto_strip_attributes :name, squish: true
  #STATUS = %W{ Public Hidden Disabled }

  def self.categories_tree_list parent_id = 0,level = 0
    level_text = ''; tree = []
    1.upto(level) {level_text << "    "} if level > 0
    root = Category.select("id, name").where("parent_id = ?", parent_id).order("name")
    for r in root
      tree << [(level_text + r.name.to_s.capitalize), r.id.to_s]
      tmp = categories_tree_list(r.id, level + 1)
      tree = tree + tmp unless tmp.blank?
    end
    return tree
  end
end
