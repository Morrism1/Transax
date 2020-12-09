module ApplicationHelper 
  def flash_class(level)
    case level
    when 'notice' then "bg-green-400"
    when 'success' then "bg-green-500"
    when 'error' then "bg-red-500"
    when 'alert' then "bg-yellow-500"
    end
  end
end
