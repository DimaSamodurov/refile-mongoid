require "refile"

tmp_path = Dir.mktmpdir

at_exit do
  FileUtils.remove_entry_secure(tmp_path)
end

Refile.store = Refile::Backend::FileSystem.new(File.expand_path("default_store", tmp_path))
Refile.cache = Refile::Backend::FileSystem.new(File.expand_path("default_cache", tmp_path))

class FakePresignBackend < Refile::Backend::FileSystem
  def presign
    id = Refile::RandomHasher.new.hash
    Refile::Signature.new(as: "file", id: id, url: "/presigned/posts/upload", fields: { id: id, token: "xyz123" })
  end
end

Refile.backends["limited_cache"] = FakePresignBackend.new(File.expand_path("default_cache", tmp_path), max_size: 100)

Refile.direct_upload = %w[cache limited_cache]

Refile.processor(:reverse) do |file|
  StringIO.new(file.read.reverse)
end

module Refile
  class FileDouble
    attr_reader :original_filename, :content_type
    def initialize(data, name = nil, content_type: nil)
      @io = StringIO.new(data)
      @original_filename = name
      @content_type = content_type
    end

    def read(*args)
      @io.read(*args)
    end

    def size
      @io.size
    end

    def eof?
      @io.eof?
    end

    def close
      @io.close
    end
  end
end



