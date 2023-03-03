module ColorTerminal
  def red(str)
    "\e[31m#{str}\e[0m"
  end

  def green(str)
    "\e[32m#{str}\e[0m"
  end

  def yellow(str)
    "\e[33m#{str}\e[0m"
  end

  def blue(str)
    "\e[34m#{str}\e[0m"
  end
end
