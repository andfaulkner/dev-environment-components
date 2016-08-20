/// <reference path="../typings/react/react.d.ts" />
/// <reference path="../typings/react/react-dom.d.ts" />
/// <reference path="../typings/app.d.ts" />
/// <reference path="../typings/react-bootstrap/react-bootstrap.d.ts" />

import * as React from 'react';
import * as ReactDOM from 'react-dom';

import { Button } from 'react-bootstrap';

export interface CommentProps {  }
export interface CommentState {  }

console.log('js loaded');
                                           //Props   //     State
class CommentBox extends React.Component<CommentProps, CommentState> {
  render() {
    return (
      <div className="commentBox">
        <Button />
        <span>
          Hello, world! I am a CommentBox.
        </span>
      </div>);
  }
};

document.addEventListener("DOMContentLoaded", function(event) { 
  console.log('DOM loaded - mounting React');

  ReactDOM.render(
    <CommentBox />,
    document.getElementById('content')
  );
});
