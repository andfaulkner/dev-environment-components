/// <reference path="../../../typings/globals/jquery/index.d.ts" />
/// <reference path="../../../typings/globals/react/index.d.ts" />
/// <reference path="../../../typings/globals/react-dom/index.d.ts" />

declare function require(name: string);

import * as React from 'react';
import * as ReactDOM from 'react-dom';
import * as $ from 'jquery';
import {Color} from '../../enums/Color';

require('./ControllablePlayer.css');

interface ControllablePlayerState {
  xPos: number;
  yPos: number;
}

interface ControllablePlayerProps {
  color: Color;
}

export class ControllablePlayer extends React.Component<ControllablePlayerProps, ControllablePlayerState> {

  state = {
    xPos: 300,
    yPos: 300
  };

  componentDidMount = () => {
    // $(document.body).on('keydown', this.handleKeyPress);
    document.onkeydown = this.handleKeyPress;
  }

  handleKeyPress = (e) => {
    e = e || window.event;
    console.log('e:', e);
    switch (e.keyCode.toString()) {
      // up arrow
      case "38":
        console.log('up arrow pressed');
        break;
      // down arrow
      case "40":
        console.log('down arrow pressed');
        break;
      // left arrow
      case "37":
        console.log('left arrow pressed');
        break;
      // right arrow
      case "39":
        console.log('right arrow pressed');
        break;
      default:
        break;
    }
  }

  render() {
    return (
      <div id="test_id_here">Yoooooo!</div>
    );
  }
};