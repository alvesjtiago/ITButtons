ITButtons
=========

Ready to use UIButtons drawn with CoreGraphics

Example screenshot of custom nav bar back button:
![Screenshot](https://github.com/alvesjtiago/ITButtons/raw/master/screenshot.png)

## Installation
- Copy over the `ITButtons` folder to your project folder.

### Example Code

#### Custom nav bar back button
```objective-c

ITBackButton *backButton = [[ITBackButton alloc] initWithFrame:CGRectMake(0, 0, 54, 30)];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithCustomView:backButton];
```

## Credits

`ITButtons` is brought to you by Tiago Alves from Iterar (http://iterar.co).
Thank you to Jason Morrissey for the UIView+JMNoise project that allows CoreGraphics simple noise addition.

## License

### MIT License

Copyright (c) 2013 Tiago Alves

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