module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  @@data_per_page = 3
  
  def sortable(column, title = nil)
    title ||= column.titleize
    column_css = nil
    direction = "asc"

    if column == sort_column
      direction_css = "headerSortUp"
      
      if sort_direction == "asc"
        direction_css = "headerSortDown"
        direction = "desc"
      end
      
      column_css = column == sort_column ? "header #{direction_css}" : nil      
    end

    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => column_css}
  end

end
