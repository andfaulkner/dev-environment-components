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

      // FROM CONFIG FILE:::
      // "https://npmcdn.com/react@15.3.1/dist/react.js",
      // "https://npmcdn.com/react-dom@15.3.1/dist/react-dom.js",
      // "https://npmcdn.com/babel-core@5.8.38/browser.min.js",
      // "https://npmcdn.com/jquery@3.1.0/dist/jquery.min.js",
      // "https://npmcdn.com/remarkable@1.6.2/dist/remarkable.min.js",
      // "https://cdnjs.cloudflare.com/ajax/libs/react-bootstrap/0.30.2/react-bootstrap.min.js"
      // 
      // ALSO FROM CONFIG FILE (styles section::
      //     "https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css",
      //     "https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap-theme.min.css"


        // under 
        // <div className={"random-tinkering"} />
        // <div className={"random-tinkering-triangle"} />
        // <div className={"hollow-triangle"} />
