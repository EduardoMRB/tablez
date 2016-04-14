require 'tablez'

module HeredocFormatting
  def deindent
    strip.gsub(/(^\s*)/, "")
  end
end

String.send(:include, HeredocFormatting)
