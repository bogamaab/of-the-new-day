module FormService
  def label(attribute = nil)
    template_translations(self.class::LABEL_TRANSLATION)[attribute]
  end
end
