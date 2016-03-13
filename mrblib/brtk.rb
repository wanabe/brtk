GirFFI::setup :WebKit

class Brtk
  def initialize(uri = nil)
    Gtk.init
    MainWindow.new(uri)
  end

  def main
    Gtk.main
  end

  class << self
    def run(uri = nil)
      new(uri).main
    rescue Exception => e
      p e
    end
  end

  class Widget
    attr_accessor :widget

    def children
      @children ||= []
    end

    def add(other)
      children << other
      widget.add other.widget
    end

    def setup(klass, *args)
      @widget = klass.new(*args)
    end
  end

  class Layout < Widget
    def pack_start(other, *args)
      children << other
      widget.pack_start other.widget, *args
    end
  end

  class MainWindow < Widget
    def initialize(uri = nil)
      setup Gtk::Window, Gtk::WindowType::TOPLEVEL
      widget.set_default_size 1000, 600
      add MainLayout.new(uri)

      widget.signal_connect("destroy") do |*o|
        Gtk.main_quit
      end
      widget.show_all
    end
  end

  class MainLayout < Layout
    def initialize(uri = nil)
      setup Gtk::Box, Gtk::Orientation::VERTICAL, 0

      @browser_window = BrowserWindow.new(uri)
      parts.each do |part|
        pack_start part, true, true, 2
      end
    end

    def parts
      [@browser_window]
    end
  end

  class BrowserWindow < Widget
    def initialize(uri = nil)
      setup Gtk::ScrolledWindow, nil,nil
      widget.set_policy Gtk::PolicyType::AUTOMATIC, Gtk::PolicyType::AUTOMATIC

      add WebRenderer.new(uri)
    end
  end

  class WebRenderer < Widget
    def initialize(uri = nil)
      setup WebKit::WebView
      open uri if uri
    end

    def open(uri)
      widget.open uri
    end
  end
end
