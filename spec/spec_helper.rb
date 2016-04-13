require 'tablez'

module HereDocFormatting
  def deindent
    strip.gsub(/(^\s*)/, "")
  end
end

String.send(:include, HereDocFormatting)
