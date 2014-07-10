# Ralawisify

A command line Ruby application for mapping a [Ralawise](http://www.ralawise.com/) data file into an importable [Shopify](http://www.shopify.co.uk/) products data file.

## Dependancies

1. Ruby `>= 2.0`

## Options

    ./clamp --help
    
    # Full path to source Ralawise CSV file
    -r, --ralawise
    
    # Full path to output Shopify CSV file
    -s, --shopify
    
    # Full path to Available Images CSV file
    -l, --image_list
    
## Usage

    ./clamp \
    -r '/Users/Me/Downloads/RalawiseSource.csv' \
    -i 'https://dl.dropboxusercontent.com/u/2413173/images' \
    -l '/Users/Me/Downloads/available_images.csv'

Data files are placed within the `tmp` directory in seperate files. File sizes are limited as large files seem to crash Shopify.
    
## Example Data Files
Example `csv` files for can be found within the `spec/support` directory.

1. `source.csv` is the Ralawise original data file.
2. `output.csv` is the generated Shopify data file for import.   
3. `available_images.csv` is a file containing all the known images you have placed on a server. This is used to replace missing images with an `error.jpeg` you have placed within the same directory.
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request`

## License

MIT License (MIT)

Copyright (c) 2012-2014 [Kudos Printers](http://www.kudosprinters.co.uk/)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
