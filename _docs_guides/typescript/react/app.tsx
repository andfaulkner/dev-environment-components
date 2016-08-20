/// <reference path="../typings/react/react.d.ts" />
/// <reference path="../typings/react/react-dom.d.ts" />
/// <reference path="../typings/app.d.ts" />

import 'babel-polyfill';

import * as React from 'react';
import * as ReactDOM from 'react-dom';

export interface CommentProps {  }

class CommentBox extends React.Component<CommentProps, {}> {
  render() {
    return (
      <div className="commentBox">
        Hello, world! I am a CommentBox.
      </div>)
  }
};

ReactDOM.render(
  <CommentBox />,
  document.getElementById('content')
);