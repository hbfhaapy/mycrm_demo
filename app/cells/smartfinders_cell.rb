class SmartfindersCell < Cell::Rails

  helper ApplicationHelper
  append_view_path "app/views"

  def form(opts)
    @klass = opts[:klass]
    @smartfinder = opts[:smartfinder]

    render
  end

end
