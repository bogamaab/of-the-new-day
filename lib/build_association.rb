class BuildAssociation
  attr_reader :source, :klass

  def initialize(source, klass)
    @source = source
    @klass = klass
  end

  def build
    association = source.class.reflect_on_association(klass).macro
    send("build_#{association}_association")
  end

  def build_belongs_to_association
    source.send("build_#{klass}")
  end

  def build_has_one_association
    source.send("build_#{klass}")
  end

  def build_has_many_association
    source.send("build_#{klass}")
  end
end
