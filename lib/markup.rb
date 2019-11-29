require 'active_support/inflector'

module Markup

  def self.recursively_assign(array,keys,hash)
    keys.each do |k|
      # recursively build sections from nested hash
      if hash[k].is_a? Hash
        new_section =  Markup::Section.new(title: k)
        array.push new_section
        self.recursively_assign(new_section.children,hash[k].keys,hash[k])
      else
        # object found, just push it on and return (no nesting)
        hash[k].title = k
        array.push hash[k]
      end
    end
  end
      
  module Tools
    def writer(*args)
      puts(*args) # for now
    end
  end

end
