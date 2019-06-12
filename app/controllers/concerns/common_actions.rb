module CommonActions
  extend ActiveSupport::Concern

  def ladies_category
    @ladies_child_category = Category.where(parent_id:1)
    ladies_child_ids = @ladies_child_category.map{|child| child.id}
    @ladies_grand_child_category = Category.child_num(ladies_child_ids)
    ladies_grand_child_ids = @ladies_grand_child_category.map{|grand_child| grand_child.id}
  end

  def mens_category
    @mens_child_category = Category.where(parent_id:2)
    mens_child_ids = @mens_child_category.map{|child| child.id}
    @mens_grand_child_category = Category.child_num(mens_child_ids)
    mens_grand_child_ids = @mens_grand_child_category.map{|grand_child| grand_child.id}
  end

  def baby_category
    @baby_child_category = Category.where(parent_id:3)
    baby_child_ids = @baby_child_category.map{|child| child.id}
    @baby_grand_child_category = Category.child_num(baby_child_ids)
    baby_grand__child_ids = @baby_grand_child_category.map{|grand_child| grand_child.id}
  end

  def cosmes_category
    @cosmes_child_category = Category.where(parent_id:7)
    cosmes_child_ids = @cosmes_child_category.map{|child| child.id}
    @cosmes_grand_child_category = Category.child_num(cosmes_child_ids)
    cosmes_grand__child_ids = @cosmes_grand_child_category.map{|grand_child| grand_child.id}
  end


end
