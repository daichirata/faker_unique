require "faker_unique/version"
require "faker"

module FakerUnique
  def uniq(max_retries = 100)
    (@proxy ||= UniqueProxy.new(self)).tap do |p|
      p.max_retries = max_retries
    end
  end

  class UniqueProxy
    attr_writer :max_retries

    def initialize(klass)
      @klass = klass
      reset!
    end

    def reset!
      @pool = Hash.new {|h,k| h[k] = {}}
    end

    def method_missing(m, *args, &block)
      counter = 0
      begin
        if counter > @max_retries
          raise "Maximum retries of %d reached without finding a unique value" % @max_retries
        end
        res = @klass.send(m, *args, &block)
        counter += 1
      end while @pool[m][res]

      @pool[m][res] = true
      res
    end
  end
end

Faker::Base.extend(FakerUnique)
