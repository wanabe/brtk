class Brtk
  def initialize(uri = nil)
    @widgets = {}
    Gtk.init
    MainWindow.new(self)
    @widgets[WebRenderer].open uri if uri
  end

  def main
    @widgets.each do |klass, widget|
      widget.run
    end
    Gtk.main
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
