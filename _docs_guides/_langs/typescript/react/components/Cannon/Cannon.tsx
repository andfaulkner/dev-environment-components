/// <reference path="../../../typings/globals/jquery/index.d.ts" />
/// <reference path="../../../typings/globals/react/index.d.ts" />
/// <reference path="../../../typings/globals/react-dom/index.d.ts" />
/// <reference path="../../../typings/globals/lodash/index.d.ts" />

declare function require(name: string);

import _ from 'lodash';
import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';

require('./Cannon.css');

interface CannonProps { };

interface CannonState {
  ammo: number;
  level: number;
};

export class Cannon extends React.Component<CannonProps, CannonState> {

  events = {
    spacePressed: (e) => {
      console.log('e:', e);
    }
  };

  render() {
    return (
      <div id={"weapon"}>
        <div id={"cannon"} />
      </div>
    );
  }
};

// under a div
// <div className={"random-tinkering"} />
// <div className={"random-tinkering-triangle"} />
// <div className={"hollow-triangle"} />
