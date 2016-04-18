module CoreExt
  module Array
    module PadEndWithNil
      def pad_end_with_nil(len)
        return dup if self.size >= len.abs
        self + ::Array.new(len - size, nil)
      end
    end
  end
end
