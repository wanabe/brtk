# brtk
BRowser ToolKit
## build as command
```
make
```
## build with existing mruby (optional)
```
ln -s /path/to/your/mruby vendor/mruby
make
```
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'wanabe/brtk'
end
```
## Usage
```
./bin/brtk
```
## License
under the MIT License:
- see LICENSE file
