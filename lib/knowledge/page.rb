# encoding: utf-8
require 'github/markdown'
require 'stringex'
module Knowledge
  class PageNotFound < StandardError
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end

  class Page
    def initialize(blob)
      @blob = blob
    end
    
    def self.format_path(path)
      # replace "\" to "/"
      str_slash_translated = path.strip().gsub("\\","\/")
      # split page path name by "/"
      arr_path = str_slash_translated.split("\/")
      arr_formated = []
      arr_path.each do |item|
        arr_formated << item.to_url
      end
      # delete no sense
      arr_formated.delete("")
      return arr_formated.join("\/")
    end

    def self.find_all
      return [] if repository.tree.contents.empty?
      repository.tree.contents.collect { |blob| new(blob) }
    end

    def self.find(name)
      page_blob = find_blob(name)
      if page_blob
        new(page_blob)
      else
        nil
      end
    end
    
    def self.find_or_create(name)
      page = find(name)
      if page.nil?
        new(create_blob_for(name))
      else
        page
      end
    end

    def self.repository
      Knowledge.repository || raise
    end

    def self.find_blob(page_name)
      repository.tree/(page_name + ".md")
    end

    def self.create_blob_for(page_name)
      Grit::Blob.create(repository, {
        :name => page_name + "md",
        :data => ""
      })
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

    def update_content(new_content,path)
      return if new_content == content
      file_name = File.join(self.class.repository.working_dir, path + ".md")
      File.open(file_name, "w") { |f| f << new_content }
      add_to_index_and_commit!(path+".md")
    end

    private
      def add_to_index_and_commit!(path)
        Dir.chdir(self.class.repository.working_dir) {
          self.class.repository.add(path)
        }
        self.class.repository.commit_index(commit_message)
      end

      def commit_message
        "Updated #{name}"
      end

  end
end
