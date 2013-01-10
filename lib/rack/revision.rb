module Rack
  class Revision
    @@revision = nil
    File = ::File
    
    def initialize(app, &block)
      @app   = app
      @block = block
      @file  = File.join(Dir.pwd, 'REVISION')
    end
    
    def call(env)
      status, headers, body = @app.call(env)
      headers['X-Revision'] = revision
      [status, headers, body]
    end
    
    protected
    
    def revision
      @@revision ||= read_revision
    end
    
    def read_revision
      File.exists?(@file) ? File.read(@file).strip : 'UNDEFINED'
    end
  end
end