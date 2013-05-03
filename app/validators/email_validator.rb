# -*- encoding : utf-8 -*-
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    
    record.errors[attribute] << "email invalido" unless value.match(/^\w*@\w*\.[^ ]*$/)
  end
end