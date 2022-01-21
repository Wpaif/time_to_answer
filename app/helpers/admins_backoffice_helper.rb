module AdminsBackofficeHelper
  def translate_attribute(object = nil, method = nil)
    if object && method
      object.model.human_attribute_name(method.to_sym)
    else
      'Invalid parameters to complete the translation of this attribute'
    end
  end
end
