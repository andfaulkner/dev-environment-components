/// <reference path="../typings/globals/react/index.d.ts" />
/// <reference path="../typings/globals/react-dom/index.d.ts" />
/// <reference path="../typings/globals/react-bootstrap/index.d.ts" />

import * as React from 'react';
import * as ReactDOM from 'react-dom';

import { Button } from 'react-bootstrap';

import { TestComponent } from './components/TestComponent';
// import { Header } from './components/Header';
import { ControllablePlayer } from './components/ControllablePlayer/ControllablePlayer';

import {Color} from './enums/Color';

// import { Header } from './components/Header';

interface Foo {
  test: number;
}

let bar = { test: 4 };

let foo = bar as Foo;
console.log('foo', foo);

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
        <ControllablePlayer color={Color.Red} />
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
