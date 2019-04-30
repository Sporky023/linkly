class BasePresenter
  delegate_missing_to :@model

  def initialize(model, view_context)
    @model = model
    @view_context = view_context
  end
end
