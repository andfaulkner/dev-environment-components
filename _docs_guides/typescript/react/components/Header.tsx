/// <reference path="../../typings/react-menu-bar/react-menu-bar.d.ts" />
/// <reference path="../../typings/react/react.d.ts" />

import { MenuBar, MenuItem, Menu, Separator } from 'react-menu-bar';
import * as React from 'react';

export interface HeaderProps {  }
export interface HeaderState {  }


class Header extends React.Component<HeaderProps, HeaderState> {
  render() {
    return (
      <div>Yo</div>
    );
  }
};

