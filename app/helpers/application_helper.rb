module ApplicationHelper
  def flash_class(level)
    {
      'notice' => 'bg-green-400',
      'alert' => 'bg-yellow-400',
      'error' => 'bg-red-500',
      'success' => 'bg-green-500'
    }[level]
  end
end
