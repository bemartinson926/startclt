module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug
    class_attribute :slug_column
  end

  def to_param
    self.slug
  end

  def generate_slug
    the_slug = self.send(self.class.slug_column.to_sym).parameterize
    obj = self.class.find_by slug: the_slug
    count = 2
    while obj && obj != self
      the_slug = append_suffix(the_slug, count)
      obj = self.class.find_by slug: the_slug
      count += 1 
    end
    self.slug = the_slug
  end

  def append_suffix(str, count)
    if str.split('-').last.to_i != 0
      return str.split('-').slice(0...-1).join('-') + '-' + count.to_s
    else
      return str + '-' + count.to_s
    end
  end

  module ClassMethods
    def sluggable_column(column_name)
      self.slug_column = column_name
    end
  end
end