/// <reference path="../../../typings/globals/jquery/index.d.ts" />
/// <reference path="../../../typings/globals/react/index.d.ts" />
/// <reference path="../../../typings/globals/react-dom/index.d.ts" />
/// <reference path="../../../typings/globals/lodash/index.d.ts" />

declare function require(name: string);

import * as _ from 'lodash';
import * as React from 'react';
import * as ReactDOM from 'react-dom';
import * as $ from 'jquery';

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