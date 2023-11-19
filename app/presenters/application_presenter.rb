class ApplicationPresenter < SimpleDelegator
  include ActionView::Helpers

  attr_reader :source, :options

  def initialize(source, **options)
    @source = source
    @optiones = options
    super(source)
  end

  def rails_routes
    Rails.application.routes.url_helpers
  end

  def yield_if(condition)
    yield if condition
  end

  def build_association(klass)
    BuildAssociation.new(source, klass).build
  end

  def error_message(attribute = nil)
    source.errors.messages[attribute].first
  end
end
