/// <reference path="../typings/globals/react/index.d.ts" />
/// <reference path="../typings/globals/react-dom/index.d.ts" />
/// <reference path="../typings/globals/react-bootstrap/index.d.ts" />

import React from 'react';
import ReactDOM from 'react-dom';

import { Button } from 'react-bootstrap';

import { TestComponent } from './modules/TestComponent';
// import { Header } from './modules/Header';
import { Player } from './modules/Player/Player';
import { ArenaBorder } from './modules/ArenaBorder/ArenaBorder';
import { KeyController } from './modules/KeyController/KeyController';

import { PlayerColor } from './enums/enums';

/**************************************** TYPE DEFINITIONS ****************************************/
export interface CommentProps { };
export interface CommentState { };

export interface Input {
  time: number;
}

/******************************************* COMPONENTS *******************************************/
class App extends React.Component<{}, {}> {
  state = {
    input: {
      time: Date.now()
    }
  };

  componentWillMount = () => {
    requestAnimationFrame(this.tick);
  }

  render() {
    return (
      <div>
        <KeyController input={ this.state.input } />
        <Player input={this.state.input} color={PlayerColor.Red} width={20} height={20} />
        <ArenaBorder />
      </div>
    );
  };

  /**
   * The game loop. Coordinates everything. Changes propagate down the tree every time it ticks
   */
  tick = () => {
    console.log('app.tsx:: game loop ticked!');
    let time = Date.now();
    // requestAnimationFrame(this.tick);
    this.setState({
      input: {
        time
      }
    });
  };
};

document.addEventListener("DOMContentLoaded", function(event) {
  console.log('DOM loaded - mounting React');
  ReactDOM.render(
    <App />,
    document.getElementById('content')
  );
});
