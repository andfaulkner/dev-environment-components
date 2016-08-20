/// <reference path="../typings/react/react.d.ts" />
/// <reference path="../typings/react/react-dom.d.ts" />
/// <reference path="../typings/app.d.ts" />

import 'babel-polyfill';

import * as React from 'react';
import * as ReactDOM from 'react-dom';

var CommentBox = React.createClass({
  render: () => (
    <div className="commentBox">
      Hello, world! I am a CommentBox.
    </div>)
});
ReactDOM.render(
  <CommentBox />,
  document.getElementById('content')
);
