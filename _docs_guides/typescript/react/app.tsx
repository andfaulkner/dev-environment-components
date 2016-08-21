/// <reference path="../typings/react/react.d.ts" />
/// <reference path="../typings/react/react-dom.d.ts" />
/// <reference path="../typings/app.d.ts" />
/// <reference path="../typings/react-bootstrap/react-bootstrap.d.ts" />

import * as React from 'react';
import * as ReactDOM from 'react-dom';

import { Button } from 'react-bootstrap';

import { TestComponent } from './components/TestComponent';
import { Header } from './components/Header';

// import { Header } from './components/Header';

export interface CommentProps { };
export interface CommentState { };

console.log('js loaded');
                                           //Props   //     State
class CommentBox extends React.Component<CommentProps, CommentState> {
  render() {
    return (
      <div className="commentBox">
        <Button />
        <TestComponent />
        <span>
          Hello, world! I am a CommentBox.
        </span>
      </div>);
  }
};

class App extends React.Component<{}, {}> {
  render() {
    return (
      <div>
        <CommentBox />
      </div>
    );
  }
};

document.addEventListener("DOMContentLoaded", function(event) {
  console.log('DOM loaded - mounting React');
  ReactDOM.render(
    <App />,
    document.getElementById('content')
  );
});
