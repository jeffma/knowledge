require 'github/markdown'
module Knowledge
  class Page
    def initialize(blob)
      @blob = blob
    end

    def self.find_all
      return [] if repository.tree.contents.empty?
      repository.tree.contents.collect { |blob| new(blob) }
    end

    def self.find(name)
      page_blob = find_blob(name)
      #raise PageNotFound.new(name) unless page_blob
      new(page_blob)
    end

    def self.repository
      Knowledge.repository || raise
    end

    def self.find_blob(page_name)
      repository.tree/(page_name + ".md")
    end


    def name
      @blob.name.gsub(/#{File.extname(@blob.name)}$/, '')
    end

    def content
      @blob.data
    end

    def to_html
      GitHub::Markdown.render_gfm(content)     
    end

    def to_s
      name
    end

  end
end
