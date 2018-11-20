/// <reference path="../../../typings/globals/react/index.d.ts" />
/// <reference path="../../../typings/globals/react-dom/index.d.ts" />

declare function require(name: string);

import React from 'react';
import ReactDOM from 'react-dom';

require('./ArenaBorder.css');

export const ArenaBorder = () => (
  <div>
    <div className="arena centered"></div>
  </div>
);
