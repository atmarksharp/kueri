require "kueri/version"
require "nokogiri"

module Kueri
  class E
    include Enumerable
    def initialize(elm)
      @elm = elm
    end

    def [](query)
      if query.is_a? String
        self.find(query)
      elsif query.is_a? Fixnum
        E.new( @elm[query] )
      else
        raise "query should be String or Fixnum"
      end
    end

    def find(query)
      elm = @elm.css(query)
      E.new(elm)
    end

    def size
      @elm.size
    end

    def length
      @elm.size
    end

    def raw
      @elm
    end

    def each
      @elm.each do |o|
        yield E.new(o)
      end
    end

    def children
      @elm.children
    end

    def attr(key)
      @elm.attr(key).to_s
    end

    def text
      @elm.text
    end

    def to_s
      @elm.to_s
    end
  end

  # ====================

  def self.parse(s)
    doc = Nokogiri::HTML(s)
    E.new(doc)
  end
  
end
