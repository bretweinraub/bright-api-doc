module Markup
  class Section < CkuruTools::HashInitializerClass
    instance_of_class_accessor Doc, :doc
    instance_of_class_accessor String, :title
    instance_of_class_accessor String, :text
    instance_of_class_accessor Section, :parent
    instance_of_class_accessor Array, :sectionNumber
    instance_of_class_accessor String, :file
    instance_of_class_accessor Array, :children

    include Tools

    def initialize(h={})
      self.children = []
      super
    end

    def full_sanitized_title
      if parent
        parent.full_sanitized_title + '-' + sanitized_title
      else
        sanitized_title
      end
    end

    def sanitized_title
      title.parameterize
    end

    def dir_path
      (parent ? "#{parent.dir_path}/" : '') + sanitized_title
    end

    def build_map(h={})
      sectionMap,base,parent,doc = CkuruTools.only_these_parameters(
        h,
        [:sectionMap,{:instance_that_inherits_from => Hash}],
        [:base,{:instance_that_inherits_from => String}],
        [:parent,{:instance_that_inherits_from => Section}],
        [:doc,{:instance_that_inherits_from => Doc, :required => true}],
        )

      if parent
        self.parent = parent
      end

      self.doc = doc

      if ! self.text && ! self.file
        self.file = File.join(doc.path.gsub(/\.[a-z]+$/,''), "#{dir_path}.md")
        STDERR.puts "Loading #{file}"
        if File.exists?(file)
          t=`cat #{file}`
          self.text = t
          if t.length <= 1
            STDERR.puts  file
            STDERR.puts "WARNING: File #{file} is empty .... just so you know.   Maybe put something in there?"            
          end
        else
          Dir.mkdir(File.dirname(file)) rescue nil
          STDERR.puts  file          
          STDERR.puts "WARNING: File #{file} is missing .... just so you know.   Maybe put something in there?"
          system("touch #{file}")
        end
      end
        
      ckebug 1, "#{self.sectionNumber} #{self.title}"

      sn = 1
      children.each do |child|
        newSection = self.sectionNumber.dup
        newSection.push sn
        child.sectionNumber = newSection

        base += '.' + child.title
        
        sectionMap[base] = child
        sectionMap[child.sectionNumber] = child

        child.build_map(
          sectionMap: sectionMap,
          base: base,
          parent: self,
          doc: self.doc
          )

        sn += 1
      end
    end

    def depth
      self.sectionNumber.length
    end

    def section_markup_start
      (1..(depth+1)).collect {|x| '#'}.join
    end

    def linkify
      sectionNumber.collect {|x| "#{x}"}.join('-')
    end

    def section_number
      sectionNumber.join(".")
    end

    def toc_indention
      (1..((depth-1)*2)).collect {|x| "\t"}.join
    end


    def link
      "sec-#{linkify}"
    end

    def dump(h={})
      writer <<"EOF"

<a name="#{full_sanitized_title}"></a>
<a name="#{link}"></a>
#{section_markup_start} #{section_number}. #{title}

#{text}
EOF

      children.each do |child|
        child.dump
      end
    end

    def dump_toc(h={})
      writer <<"EOF"
#{toc_indention}*\t #{section_number}. [#{title}](##{link})
EOF

      children.each do |child|
        child.dump_toc
      end
      
    end
  end

  ################################################################################
  class Doc < CkuruTools::HashInitializerClass
    typed_array_accessor Section, :sections
    instance_of_class_accessor Hash, :sectionMap
    instance_of_class_accessor String, :title
    instance_of_class_accessor String, :path

    include Tools

    def dump
      sections.each do |section|
        section.dump
      end
    end

    def initialize(h={})
      self.sectionMap = {}
      self.sections = []
      super

    end

    def build_map
      sectionNumber = 1

      sections.each do |section|

        section.sectionNumber = [sectionNumber]

        self.sectionMap[section.title] = section
        self.sectionMap[section.sectionNumber] = section
        
        section.build_map(
          sectionMap: sectionMap,
          base: section.title,
          doc: self
          )
        sectionNumber += 1
      end

    end
    

    def dump_toc
      writer <<EOF
## Table of Contents
EOF
      
      sections.each do |section|
        section.dump_toc
      end
    end

    def gen
      build_map
      writer <<"EOF"
# #{title}
EOF
      dump_toc
      dump
    end
  end
end
