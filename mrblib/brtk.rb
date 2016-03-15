class Brtk
  def initialize(uri = nil)
    @widgets = {}
    Gtk.init
    MainWindow.new(self)
    send_uri uri if uri
  end

  def main
    @widgets.each do |klass, widget|
      widget.run
    end
    Gtk.main
  end

  def send_uri(uri, option = {})
    except = option[:except] || []
    @widgets.each do |klass, widget|
      next if except.include? widget
      widget.uri = uri
    end
  end

  def []=(klass, widget)
    @widgets[klass] = widget
  end

  class << self
    def run(uri = nil)
      new(uri).main
    rescue Exception => e
      p e
      puts *e.backtrace
    end
  end
end
