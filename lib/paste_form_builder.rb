class PasteFormBuilder < ActionView::Helpers::FormBuilder
  def label(attribute, options={})
    result = ""
    if @object.errors.keys.include? attribute
      for i in @object.errors[attribute] do
        result += "<span class=\"error-explanation\">#{i}</span>"
      end
    end
    super(attribute, options) + result.html_safe
  end
end
