/// <reference path="../../../typings/globals/jquery/index.d.ts" />
/// <reference path="../../../typings/globals/react/index.d.ts" />
/// <reference path="../../../typings/globals/react-dom/index.d.ts" />
/// <reference path="../../../typings/globals/lodash/index.d.ts" />


declare function require(name: string);

import * as _ from 'lodash';
import * as React from 'react';
import * as ReactDOM from 'react-dom';
import * as $ from 'jquery';
import {ProtagonistColor, Dimension} from '../../enums/enums';
import {Cannon} from '../Cannon/Cannon';
import {Input} from '../../app';

require('./Protagonist.css');

interface Coordinates {
  xPos: number;
  yPos: number;
}

interface ProtagonistState {
  xPos: number;
  yPos: number;
  speed: number;
}

interface ProtagonistProps {
  width: number;
  height: number;
  color: ProtagonistColor;
  input: Input;
}

// enum Action { Up, UpRight, Right, DownRight, Down, DownLeft, Left, UpLeft, RaiseSpeed, LowerSpeed }
let actions = {
  ArrowUp: "RaiseSpeed",
  ArrowDown: "LowerSpeed",
  w: "Up",
  e: "UpRight",
  d: "Right",
  c: "DownRight",
  s: "Down",
  z: "DownLeft",
  a: "Left",
  q: "UpLeft"
};


export class Protagonist extends React.Component<ProtagonistProps, ProtagonistState> {

  state = {
    xPos: 0,
    yPos: 0,
    speed: 3
  };

  componentDidMount = (): void => {
    document.onkeydown = this.events.keypress;
  }

  /**
   * Ensure protagonist sprite is in bounds on the given dimension
   */
  checkInBounds_1D = (position: number, dimen: Dimension, state: ProtagonistState): number => {
    if (position >= 300) {
      return 300;
    }
    if (position - this.props[Dimension[dimen].toString()] <= -300) {
      return -300 + this.props[Dimension[dimen].toString()];
    }
    return position;
  }

  /**
   * Ensure protagonist sprite remains in bounds on all dimensions
   */
  keepInBounds = (xPos: number, yPos: number) : Coordinates => (
    {
      xPos: this.checkInBounds_1D(xPos, Dimension.width, this.state),
      yPos: this.checkInBounds_1D(yPos, Dimension.height, this.state)
    });

  /**
   * Reduce or increase protagonist sprite speed (i.e. in response to keypresses)
   */
  adjustSpeed = (action, speed): number => speed + (action === "RaiseSpeed" ? 1 :
                                                    (action === "LowerSpeed" ? -1 : 0));

  /**
   * Respond to keyboard to change protagonist sprite's position
   */
  move = ({ xPos, yPos, speed }: ProtagonistState, key: string, action: string = ""): void => {
    console.log(`${key} pressed`);
    let yPosNew: number = yPos + (action.match(/Up/g) ? speed :
                                 (action.match(/Down/g) ? -1 * speed : 0));
    let xPosNew: number = xPos + (action.match(/Left/g) ? speed :
                                 (action.match(/Right/g) ? -1 * speed : 0));
    console.log('Protagonist.tsx:: move: xPosNew: ', xPosNew, '; yPosNew: ', yPosNew);

    this.setState(Object.assign(this.keepInBounds(xPosNew, yPosNew),
                                { speed: this.adjustSpeed(action, speed) }));
  };

  events = {
    keypress: (e: KeyboardEvent): void => {
      console.log('e:', e);
      let keyName = _.get(actions, e.key);
      if (_.isString(keyName)) {
        this.move(this.state, e.key, keyName);
      }
    }
  };

  calcOffset = (): {marginTop: string; marginLeft: string} => (
    {
      marginTop: (-1 * this.state.yPos) + 'px',
      marginLeft: (-1 * this.state.xPos) + 'px'
    });

  render() {
    console.log('Protagonist.tsx:: RE-RENDERED!');
    return (
      <div>
        <div className="centered" id="protagonist" style={this.calcOffset()}>
        </div>
      </div>
    );
  }
};

// Perhaps add against later, inside div.centered#protagonist: <Cannon />
