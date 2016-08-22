/// <reference path="../typings/globals/react/index.d.ts" />
/// <reference path="../typings/globals/react-dom/index.d.ts" />
/// <reference path="../typings/globals/react-bootstrap/index.d.ts" />

import * as React from 'react';
import * as ReactDOM from 'react-dom';

import { Button } from 'react-bootstrap';

import { TestComponent } from './components/TestComponent';
// import { Header } from './components/Header';
import { Protagonist } from './components/Protagonist/Protagonist';
import { ArenaBorder } from './components/ArenaBorder/ArenaBorder';

import { ProtagonistColors } from './enums/ProtagonistColors';

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
        <Protagonist color={ProtagonistColors.Red} width={20} height={20} />
        <ArenaBorder />
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
