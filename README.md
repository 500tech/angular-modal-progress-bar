# angular-modal-progress-bar

A modal with progression bar that fills up with known duration.


## Install

Install via bower:

```bash
bower install --save angular-modal-progress-bar
```

Add to index.html:

```html
<link rel="stylesheet" href="bower_components/angular-modal-progress-bar/dist/angular-modal-progress-bar.css">
<script type="text/javascript" src="bower_components/angular-modal-progress-bar/dist/angular-modal-progress-bar.js"></script>
```

Inject ``'500tech.modal-progress-bar'`` into your main module:

```javascript
angular.module('App', [
  // ... other dependencies
  '500tech.modal-progress-bar'
])
```

## Usage

Add ``<progress-modal></progress-modal>`` directive to your main html file.

Loader service gets a list of states, each with phrases that will be shown and duration for progress bar to be filled:

```javascript
app.run(['$scope', 'Loader', function($scope, Loader) {
  Loader.states = {
    mainScreen: {
      phrases: [
        'Loading application',
        'Preparing markup'
      ],
      duration: 3
    },
    checkout: {
      phrases: [
        'Checking billing information',
        'Sending data to local vendor',
        'Finalizing'
      ],
      duration: 5
    }
  }
}]);
```

Now when you want to show the progression modal, just call ```Loader.start('stateName')``` to start it and Loader.end() on another controller to stop it. The progress bar will fill up in a number of seconds you passed in the states object.


## License

MIT Licensed

Copyright (c) 2014, [500Tech](http://500tech.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sub-license, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
