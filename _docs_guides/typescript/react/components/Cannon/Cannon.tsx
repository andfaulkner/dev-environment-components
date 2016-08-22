/// <reference path="../../../typings/globals/jquery/index.d.ts" />
/// <reference path="../../../typings/globals/react/index.d.ts" />
/// <reference path="../../../typings/globals/react-dom/index.d.ts" />
/// <reference path="../../../typings/globals/lodash/index.d.ts" />

declare function require(name: string);

import * as _ from 'lodash';
import * as React from 'react';
import * as ReactDOM from 'react-dom';
import * as $ from 'jquery';

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
      // let keyName = _.get(actions, e.key);
      // if (_.isString(keyName)) {
        // this.move(this.state, e.key, keyName);
      // }
    }
  };

  render() {
    return (
      <div>
        
      </div>
    );
  }
};