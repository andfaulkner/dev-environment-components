/// <reference path="../../../typings/globals/jquery/index.d.ts" />
/// <reference path="../../../typings/globals/react/index.d.ts" />
/// <reference path="../../../typings/globals/react-dom/index.d.ts" />
/// <reference path="../../../typings/globals/lodash/index.d.ts" />

declare function require(name: string);

import _ from 'lodash';
import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';

require('./KeyController.css');

interface KeyControllerProps {
  input: { time: number };
};

interface KeyControllerState {

};

export class KeyController extends React.Component<KeyControllerProps, KeyControllerState> {

  events = {
    keyPressed: (e) => {
      console.log('KeyController.tsx:: key pressed: e.key: ', e.key);
    }
  };

  render() {
    return (
      <div>Yo</div>
    );
  }
};