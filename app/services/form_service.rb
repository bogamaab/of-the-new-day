module FormService
  def label(attribute = nil)
    template_translations(self.class::LABEL_TRANSLATION)[attribute]
  end

  def placeholder(attribute = nil)
    template_translations(self.class::PLACEHOLDER_TRANSLATION)[attribute]
  end

  def attribute_type(attribute = nil)
    self.class::TYPES_OF_ATTRIBUTES[attribute]
  end

  def input_class(attribute = nil)
    self.class::INPUT_CLASSES[attribute]
  end

  def label_class(attribute = nil)
    self.class::LABEL_CLASSES[attribute]
  end

  def error(attribute = nil)
    source.errors.messages[attribute].first
  end

  def template_translations(template = nil)
    template.present? ? I18n.t(template).deep_symbolize_keys : {}
  end

  def build_hash_attribute(attribute = nil)
    {
      label: { label: label(attribute), class: label_class(attribute),
               required: false },
      input: { as: attribute_type(attribute), placeholder: placeholder(attribute),
               error: false, input_html: { class: input_class(attribute) } },
      error: error(attribute)
    }
  end

  def form
    array_iterator(self.class::ATTRIBUTES)
  end

  def array_iterator(arr)
    arr.each_with_object({}) do |obj, info_obj|
      info_obj[obj] = build_hash_attribute(obj)
    end
  end
end
